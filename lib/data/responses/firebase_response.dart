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

class FirebaseGetResopnse<T> extends FirebaseResponse{
  final T? content;
  
  FirebaseGetResopnse(super.isSucces, super.errorOccured, 
  super.error, super.errorMessage, this.content);

  T getContentUnsafe(){
    return content as T;
  }


  static FirebaseGetResopnse<TResponse> succes<TResponse>(TResponse content) 
    => FirebaseGetResopnse<TResponse>(true, false, null, null, content);
  static FirebaseGetResopnse<TResponse> withError<TResponse>(Exception error)
    => FirebaseGetResopnse<TResponse>(false, true, error, null, null);
  static FirebaseGetResopnse<TResponse> withErrorMessage<TResponse>(String message)
  => FirebaseGetResopnse<TResponse>(false, true, null, message, null);
}