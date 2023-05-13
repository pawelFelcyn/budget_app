import 'package:budget_app/domain/validators/validation_result.dart';

abstract class Validator<T>{
  ValidationResult validate(T model);
}