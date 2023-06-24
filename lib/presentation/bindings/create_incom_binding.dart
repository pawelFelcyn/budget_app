import 'package:budget_app/domain/services/incom_service.dart';
import 'package:budget_app/domain/validators/create_incom_dto_validator.dart';
import 'package:budget_app/presentation/controllers/create_incom_controller.dart';
import 'package:get/get.dart';

class CreateIncomBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateIncomDtoValidator());
    Get.lazyPut<IncomService>(() => IncomServiceImpl());
    Get.lazyPut(() => CreateIncomController(
      Get.find<CreateIncomDtoValidator>(),
      Get.find<IncomService>()
    ));
  }
}