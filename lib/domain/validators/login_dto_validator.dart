import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class LoginDtoValidator extends Validator<LoginDto>{
  @override
  ValidationResult validate(LoginDto model){
    var output = '';

    if (model.email == ''){
      output = "${output}Email cannot be empty.";
    }

    if (model.password == ''){
      output = '$output Password must not be empty.';
    }

    return output == '' ? ValidationResult.success() : ValidationResult.failure(output);
  }
}