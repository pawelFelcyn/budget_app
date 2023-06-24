import 'package:budget_app/domain/validators/validation_error.dart';
import 'package:get/get.dart';

class ValidationResult{
  bool get isSuccess => errors.isEmpty;
  List<ValidationError> errors;

  ValidationResult(this.errors);

  ValidationError? getErrorForProperty(String propertyName){
    return errors.firstWhereOrNull((element) => element.propertyName == propertyName);
  }

  bool hasPropertyError(String propertyName){
    return errors.any((element) => element.propertyName == propertyName);
  }
}