import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/services/registration_service.dart';
import 'package:budget_app/domain/validators/register_dto_validator.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends ControllerBase{
  final RegistrationService  _service = RegistrationService();
  final RegisterDtoValidator _validator = RegisterDtoValidator();

  Rx<RegisterDto> dto = RegisterDto().obs;

  void register() async{
    if (!validate(dto.value, _validator)){
      return;
    }

    var result = await _service.register(dto.value);

    if (result.isSucces){
      Get.defaultDialog(title: 'Success', content: const Text('Succesfuly created account'));
      Get.toNamed('/login');
      return;
    }

    handleErrorFirebaseResponse(result);
  }
}