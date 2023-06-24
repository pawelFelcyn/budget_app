import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/presentation/controllers/my_incoms_controller.dart';
import 'package:get/get.dart';

class MyIncomsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyIncomsController(
      Get.find<IncomCategoryMapper>()
    ));
  }

}