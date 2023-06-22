import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:budget_app/domain/validators/create_expense_dto_validator.dart';
import 'package:budget_app/domain/validators/validator.dart';
import 'package:budget_app/presentation/controllers/create_expense_controller.dart';
import 'package:get/get.dart';

import '../../domain/services/expense_service.dart';

class CreateExpenseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Validator<CreateExpenseDto>>(() => CreateExpenseDtoValidator());
    Get.lazyPut<ExpenseService>(() => ExpenseServiceImpl());
    Get.lazyPut(() => CreateExpenseController(
      Get.find<Validator<CreateExpenseDto>>(),
      Get.find<ExpenseService>()
    ));
  }

}