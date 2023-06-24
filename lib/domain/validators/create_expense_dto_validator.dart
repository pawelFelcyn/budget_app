import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:budget_app/domain/validators/validation_error.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class CreateExpenseDtoValidator extends Validator<CreateExpenseDto> {
  @override
  ValidationResult validate(CreateExpenseDto model) {
    List<ValidationError> errors = [];
    addErrorIfNotEmpty("title", _validateTitle(model.title), errors);
    addErrorIfNotEmpty("description", _validateDesription(model.description), errors);
    addErrorIfNotEmpty("cost", _validateCost(model.cost), errors);

    return ValidationResult(errors);
  }

  String? _validateTitle(String title) {
    var output = '';

    if (title.isEmpty) {
      output = "${output}Title must not be empty. ";
    } else if (output.length > 15) {
      output = "${output}Max length of the title is 15 characters. ";
    }

    return output == '' ? null : output;
  }
  
  String? _validateDesription(String description){
    if (description.length > 50) {
      return "Max length of the description is 50 charactrers. ";
    }
    return null;
  }

  String? _validateCost(double cost){
    if (cost <= 0) {
      return "Cost must be a positive number. ";
    }
    return null;
  }
}
