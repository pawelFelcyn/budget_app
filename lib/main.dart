import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/domain/services/bilance_chart_data_provider.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/domain/services/expenses_chart_data_provider.dart';
import 'package:budget_app/domain/services/incom_service.dart';
import 'package:budget_app/domain/services/incoms_chart_data_provider.dart';
import 'package:budget_app/firebase_options.dart';
import 'package:budget_app/presentation/bindings/create_expense_binding.dart';
import 'package:budget_app/presentation/bindings/create_incom_binding.dart';
import 'package:budget_app/presentation/bindings/login_binding.dart';
import 'package:budget_app/presentation/bindings/my_expenses_binding.dart';
import 'package:budget_app/presentation/bindings/my_incoms_binding.dart';
import 'package:budget_app/presentation/bindings/register_binding.dart';
import 'package:budget_app/presentation/pages/analysis_page.dart';
import 'package:budget_app/presentation/pages/create_expense_page.dart';
import 'package:budget_app/presentation/pages/create_incom_page.dart';
import 'package:budget_app/presentation/pages/expense_details_page.dart';
import 'package:budget_app/presentation/pages/incom_details_page.dart';
import 'package:budget_app/presentation/pages/login_page.dart';
import 'package:budget_app/presentation/pages/my_expenses_page.dart';
import 'package:budget_app/presentation/pages/my_incoms_page.dart';
import 'package:budget_app/presentation/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String _getInitialRoute(){
    return FirebaseAuth.instance.currentUser == null ? '/login' : '/myexpenses';
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ExpenseCategoryMapper>(() => ExpenseCategoryMapper());
    Get.lazyPut<IncomCategoryMapper>(() => IncomCategoryMapper());
    Get.lazyPut<ExpenseService>(() => ExpenseServiceImpl());
    Get.lazyPut<IncomService>(() => IncomServiceImpl());
    Get.lazyPut<ExpensesChartDataProvider>(() => ExpensesChartDataProvider(
      Get.find<ExpenseService>(), 
      Get.find<ExpenseCategoryMapper>())
    );
    Get.lazyPut<IncomsChartDataProvider>(() => IncomsChartDataProvider(
      Get.find<IncomService>(), 
      Get.find<IncomCategoryMapper>())
    );
    Get.lazyPut<BilanceChartDataProvider>(() => BilanceChartDataProvider(
      Get.find(),
      Get.find()
    ));

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: _getInitialRoute(),
      getPages: [
        GetPage(name: '/myexpenses', 
        page: () => const MyExpensesPage(),
        binding: MyExpensesBinding()),
        GetPage(name: '/login', 
        page: () => const LoginPage(),
        binding: LoginBinding()),
        GetPage(name: '/login/register', 
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
        GetPage( name: '/myexpenses/details',
          page: () => const ExpenseDetailsPage()
        ),
        GetPage(name: '/myexpenses/create',
        page: () => const CreateExpensePage(),
        binding: CreateExpenseBinding()),
        GetPage(name: '/myincoms', 
        page: () => const MyIncomsPage(),
        binding: MyIncomsBinding()
        ),
        GetPage(name: '/myincoms/create', 
        page: () => const CreateIncomPage(),
        binding: CreateIncomBinding()
        ),
        GetPage(name: '/myincoms/details',
        page: () => const IncomDetailsPage()),
        GetPage(name: '/analysis',
        page: () => const AnalysisPage())
      ],
    );
  }
}