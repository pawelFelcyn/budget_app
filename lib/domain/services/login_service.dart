import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/data/responses/firebase_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService{
  Future<FirebaseResponse> login(LoginDto dto) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: dto.email, password: dto.password);
      return FirebaseResponse.succes();
    } on FirebaseAuthException catch (e){
      if (e.code == 'invalid-email' || e.code == 'wrong-password' || e.code == 'user-not-found'){
        return FirebaseResponse.withErrorMessage('Invalid email or password.');
      }
      return FirebaseResponse.withError(e);
    } on Exception catch (e){
      return FirebaseResponse.withError(e);
    }
  }
}