class FirebaseResponse{
  bool isSucces;
  bool errorOccured;
  Exception? error;
  String? errorMessage;
  FirebaseResponse(this.isSucces, this.errorOccured, this.error, this.errorMessage);

  static FirebaseResponse succes() 
    => FirebaseResponse(true, false, null, null);
  static FirebaseResponse withError(Exception error)
    => FirebaseResponse(false, true, error, null);
  static FirebaseResponse withErrorMessage(String message)
  => FirebaseResponse(false, true, null, message);
}