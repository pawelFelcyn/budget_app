import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NavBarController extends ControllerBase{
  logout(){
    FirebaseAuth.instance.signOut();
    Get.toNamed('/login');
  }

  void goToMyExpenses(){
    Get.toNamed('/myexpenses');
  }

  void goToMyIncoms(){
    Get.toNamed('/myincoms');
  }

  void goToAnalysis() {
    Get.toNamed('/analysis');
  }
}