import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class CreateExpenseDtoValidator extends Validator<CreateExpenseDto>{

  @override
  ValidationResult validate(CreateExpenseDto model) {
    var output = '';

    if (model.title.isEmpty){
      output = "${output}Title must not be empty. ";
    } else if (output.length > 50){
      output = "${output}Max length of the title is 50 characters. ";
    }

    if (model.description.length > 200){
      output = "${output}Max length of the description is 200 charactrers. ";
    }

    if (model.cost <= 0){
      output = "${output}Cost must be a positive number. ";
    }

    return output.isEmpty ? ValidationResult.success() : ValidationResult.failure(output);
  }

}