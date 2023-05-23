import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/services/registration_service.dart';
import 'package:budget_app/domain/validators/register_dto_validator.dart';
import 'package:budget_app/presentation/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../../domain/validators/validator.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegistrationService>(() => RegistrationServiceImpl());
    Get.lazyPut<Validator<RegisterDto>>(() => RegisterDtoValidator());
    Get.lazyPut(() => RegisterController(
      Get.find<RegistrationService>(),
      Get.find<Validator<RegisterDto>>()
      ));
  }
}