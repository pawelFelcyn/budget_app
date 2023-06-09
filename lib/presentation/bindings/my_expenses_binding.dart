import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/presentation/controllers/my_expenses_controller.dart';
import 'package:get/get.dart';

class MyExpensesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExpenseService>(() => ExpenseServiceImpl());
    Get.lazyPut(() => MyExpensesController(
      Get.find<ExpenseService>(),
      Get.find<ExpenseCategoryMapper>()
    ));
  }
}