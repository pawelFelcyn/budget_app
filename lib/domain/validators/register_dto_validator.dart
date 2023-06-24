import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/validators/validation_error.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class RegisterDtoValidator extends Validator<RegisterDto> {
  @override
  ValidationResult validate(RegisterDto model) {
    List<ValidationError> errors = [];
    addErrorIfNotEmpty("email", _validateEmail(model.email), errors);
    addErrorIfNotEmpty("password", _validatePassword(model.password), errors);
    return ValidationResult(errors);
  }

  String? _validateEmail(String email) {
    return email == '' ? "Email cannot be empty." : null;
  }

  String? _validatePassword(String password) {
    var output = '';

    if (password == '') {
      output = '$output Password must not be empty.';
    } else if (password.length < 6) {
      output = '$output Password must have at least 6 characters.';
    }

    return output == '' ? null : output;
  }
}
