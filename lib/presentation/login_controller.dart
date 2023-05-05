import 'package:get/get.dart';

class LoginController extends GetxController{
  void goToRegistration(){
    Get.toNamed('/login/register');
  }
}