import 'package:budget_app/presentation/controllers/my_incoms_controller.dart';
import 'package:get/get.dart';

class MyIncomsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyIncomsComtroller());
  }

}