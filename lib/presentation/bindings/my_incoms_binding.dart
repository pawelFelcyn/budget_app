import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/domain/services/incom_service.dart';
import 'package:budget_app/presentation/controllers/my_incoms_controller.dart';
import 'package:get/get.dart';

class MyIncomsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IncomService>(() => IncomServiceImpl());
    Get.lazyPut(() => MyIncomsController(
      Get.find<IncomService>(),
      Get.find<IncomCategoryMapper>()
    ));
  }

}