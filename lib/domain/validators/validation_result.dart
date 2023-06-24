import 'package:budget_app/domain/validators/validation_error.dart';

class ValidationResult{
  bool get isSuccess => errors.isEmpty;
  List<ValidationError> errors;

  ValidationResult(this.errors);
}