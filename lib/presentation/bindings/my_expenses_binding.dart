import 'package:budget_app/presentation/controllers/my_expenses_controller.dart';
import 'package:get/get.dart';

class MyExpensesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyExpensesController());
  }

}