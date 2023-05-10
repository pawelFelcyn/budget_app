import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/validators/validation_result.dart';

class RegisterDtoValidator{
  ValidationResult validate(RegisterDto dto){
    var output = '';

    if (dto.email == ''){
      output = "${output}Email cannot be empty.";
    }

    if (dto.password == ''){
      output = '$output Password must not be empty';
    }

    return output == '' ? ValidationResult.success() : ValidationResult.failure(output);
  }
}