import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController{
  void goToRegistration(){
    Get.toNamed('/login/register');
  }
}