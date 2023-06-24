import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get.dart';

class MyIncomsComtroller extends ControllerBase{
  void goToCreateNewView(){
    Get.toNamed('/myincoms/create');
  }
}