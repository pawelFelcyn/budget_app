import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/data/responses/register_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationService{
  Future<RegisterResponse> register(RegisterDto dto) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: dto.email,
      password: dto.password,
    );
    return RegisterResponse.succes();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use'){
      return RegisterResponse.emailTaken();
    }

    return RegisterResponse.withError(e);
  } on Exception catch (e) {
    return RegisterResponse.withError(e);
  }
}
}