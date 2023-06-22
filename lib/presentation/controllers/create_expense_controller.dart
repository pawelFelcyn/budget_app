import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../domain/validators/validator.dart';
import 'controller_base.dart';

class CreateExpenseController extends ControllerBase{
  final Rx<CreateExpenseDto> dto = CreateExpenseDto().obs;
  final RegExp costRegex = RegExp(r'^\d+\.?\d{0,2}$');
  final Validator<CreateExpenseDto> _validator;

  CreateExpenseController(this._validator);

  void submit(){
    if (!validate(dto.value, _validator)){
      return;
    }
  }
}
