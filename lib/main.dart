import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/firebase_options.dart';
import 'package:budget_app/presentation/bindings/create_expense_binding.dart';
import 'package:budget_app/presentation/bindings/create_incom_binding.dart';
import 'package:budget_app/presentation/bindings/login_binding.dart';
import 'package:budget_app/presentation/bindings/my_expenses_binding.dart';
import 'package:budget_app/presentation/bindings/my_incoms_binding.dart';
import 'package:budget_app/presentation/bindings/register_binding.dart';
import 'package:budget_app/presentation/pages/create_expense_page.dart';
import 'package:budget_app/presentation/pages/create_incom_page.dart';
import 'package:budget_app/presentation/pages/expense_details_page.dart';
import 'package:budget_app/presentation/pages/home_page.dart';
import 'package:budget_app/presentation/pages/incom_details_page.dart';
import 'package:budget_app/presentation/pages/login_page.dart';
import 'package:budget_app/presentation/pages/my_expenses_page.dart';
import 'package:budget_app/presentation/pages/my_incoms_page.dart';
import 'package:budget_app/presentation/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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
    return FirebaseAuth.instance.currentUser == null ? '/login' : '/home';
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ExpenseCategoryMapper>(() => ExpenseCategoryMapper());
    Get.lazyPut<IncomCategoryMapper>(() => IncomCategoryMapper());

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
        GetPage(name: '/home', 
        page: () => HomePage(),),
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
        page: () => const IncomDetailsPage())
      ],
    );
  }
}