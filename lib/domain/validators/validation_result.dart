class ValidationResult{
  bool isSuccess;
  String? errors;

  ValidationResult(this.isSuccess, this.errors);

  static ValidationResult success() => ValidationResult(true, null);

  static ValidationResult failure(String errors) => ValidationResult(false, errors);
}