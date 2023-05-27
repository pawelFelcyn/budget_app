import 'package:budget_app/presentation/controllers/create_expense_controller.dart';
import 'package:get/get.dart';

class CreateExpenseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateExpenseController());
  }

}