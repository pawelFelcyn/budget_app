import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class RegisterDtoValidator extends Validator<RegisterDto>{
  @override
  ValidationResult validate(RegisterDto model){
    var output = '';

    if (model.email == ''){
      output = "${output}Email cannot be empty.";
    }

    if (model.password == ''){
      output = '$output Password must not be empty.';
    } else if (model.password.length < 6){
      output = '$output Password must have at least 6 characters.';
    }

    return output == '' ? ValidationResult.success() : ValidationResult.failure(output);
  }
}