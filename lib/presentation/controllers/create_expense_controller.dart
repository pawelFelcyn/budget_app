import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../domain/services/expense_service.dart';
import '../../domain/validators/validation_result.dart';
import '../../domain/validators/validator.dart';
import 'controller_base.dart';

class CreateExpenseController extends ControllerBase{
  final Rx<CreateExpenseDto> dto = CreateExpenseDto().obs;
  final RegExp costRegex = RegExp(r'^\d+\.?\d{0,2}$');
  final Validator<CreateExpenseDto> _validator;
  final ExpenseService _service;
  Rx<ValidationResult> validationResult = ValidationResult([]).obs;

  CreateExpenseController(this._validator, this._service);

  void submit() async{
    validationResult.value = _validator.validate(dto.value);
    if (!validationResult.value.isSuccess){
      return;
    }

    var response = await _service.createExpense(dto.value);

    if (!response.isSucces){
      handleErrorFirebaseResponse(response);
      return;
    }

    Get.back();
  }
}
