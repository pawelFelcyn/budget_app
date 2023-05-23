import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/data/responses/firebase_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationServiceImpl extends RegistrationService{
  @override
  Future<FirebaseResponse> register(RegisterDto dto) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: dto.email,
      password: dto.password,
    );
    return FirebaseResponse.succes();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use'){
      return FirebaseResponse.withErrorMessage('That email is taken');
    }
    
    if (e.code == 'weak-password'){
      return FirebaseResponse.withErrorMessage('Password must have at least 6 characters');
    }

    return FirebaseResponse.withError(e);
  } on Exception catch (e) {
    return FirebaseResponse.withError(e);
  }
}
}

abstract class RegistrationService{
  Future<FirebaseResponse> register(RegisterDto dto);
}