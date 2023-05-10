class RegisterResponse{
  bool isSucces;
  bool isEmailTaken;
  bool errorOccured;
  Exception? error;
  RegisterResponse(this.isSucces, this.isEmailTaken, this.errorOccured, this.error);

  static RegisterResponse succes() 
    => RegisterResponse(true, false, false, null);
  static RegisterResponse withError(Exception error)
    => RegisterResponse(false, false, true, error);
  static RegisterResponse emailTaken()
    => RegisterResponse(false, true, false, null);
}