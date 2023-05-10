import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/services/registration_service.dart';
import 'package:budget_app/domain/validators/register_dto_validator.dart';
import 'package:budget_app/presentation/views/error_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final RegistrationService  _service = RegistrationService();
  final RegisterDtoValidator _validator = RegisterDtoValidator();

  Rx<RegisterDto> dto = RegisterDto().obs;

  void register() async{
    var validationResult = _validator.validate(dto.value);

    if (!validationResult.isSuccess){
      Get.defaultDialog(title: 'Error', content: Text(validationResult.errors ?? ''));
      return;
    }

    var result = await _service.register(dto.value);

    if (result.isSucces){
      Get.defaultDialog(title: 'Success', content: const Text('Succesfuly created account'));
      Get.toNamed('/login');
      return;
    }

    if (result.isEmailTaken){
      Get.defaultDialog(title: 'Error', content: const Text('That email is taken'));
      return;
    }

    if (result.errorOccured){
      Get.defaultDialog(title: 'Error', content: ErrorPopup(result.error.toString()));
      return;
    }
  }
}