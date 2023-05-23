import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/domain/services/login_service.dart';
import 'package:budget_app/domain/validators/login_dto_validator.dart';
import 'package:budget_app/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../domain/validators/validator.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginService>(() => LoginServiceImpl());
    Get.lazyPut<Validator<LoginDto>>(() => LoginDtoValidator());
    Get.lazyPut(() => LoginController(
      Get.find<LoginService>(),
      Get.find<Validator<LoginDto>>()
      ));
  }

}