import 'package:budget_app/domain/validators/validation_error.dart';
import 'package:budget_app/domain/validators/validation_result.dart';

abstract class Validator<T>{
  ValidationResult validate(T model);
  void addErrorIfNotEmpty(String propertyName, String? message, List<ValidationError> errors){
    if (message != null && message != ''){
      errors.add(ValidationError(propertyName, message));
    }
  }
}