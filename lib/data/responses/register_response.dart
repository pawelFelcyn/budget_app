class RegisterResponse{
  bool isSucces;
  bool errorOccured;
  Exception? error;
  String? errorMessage;
  RegisterResponse(this.isSucces, this.errorOccured, this.error, this.errorMessage);

  static RegisterResponse succes() 
    => RegisterResponse(true, false, null, null);
  static RegisterResponse withError(Exception error)
    => RegisterResponse(false, true, error, null);
  static RegisterResponse withErrorMessage(String message)
  => RegisterResponse(false, true, null, message);
}