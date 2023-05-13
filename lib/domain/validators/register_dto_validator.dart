import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/validators/validation_result.dart';

class RegisterDtoValidator{
  ValidationResult validate(RegisterDto dto){
    var output = '';

    if (dto.email == ''){
      output = "${output}Email cannot be empty.";
    }

    if (dto.password == ''){
      output = '$output Password must not be empty.';
    } else if (dto.password.length < 6){
      output = '$output Password must have at least 6 characters.';
    }

    return output == '' ? ValidationResult.success() : ValidationResult.failure(output);
  }
}