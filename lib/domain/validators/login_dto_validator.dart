import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/domain/validators/validation_error.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/domain/validators/validator.dart';

class LoginDtoValidator extends Validator<LoginDto>{
  @override
  ValidationResult validate(LoginDto model){
    List<ValidationError> errors = [];
    addErrorIfNotEmpty("email", _validateEmail(model.email), errors);
    addErrorIfNotEmpty("password", _validatePassword(model.password), errors);
    return ValidationResult(errors);
  }

   String? _validateEmail(String email) {
    return email == '' ? "Email cannot be empty." : null;
  }

  String? _validatePassword(String password) {
    return password == '' ? "Email cannot be empty." : null;
  }
}