import 'package:budget_app/data/dtos/register_dto.dart';
import 'package:budget_app/domain/services/registration_service.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/validators/validator.dart';

class RegisterController extends ControllerBase{
  final RegistrationService  _service;
  final Validator<RegisterDto> _validator;
  final Rx<RegisterDto> dto = RegisterDto().obs;
  final Rx<ValidationResult> validationResult = ValidationResult([]).obs;

  RegisterController(this._service, this._validator);


  void register() async{
    validationResult.value = _validator.validate(dto.value);
    if (!validationResult.value.isSuccess){
      return;
    }

    var result = await _service.register(dto.value);

    if (result.isSucces){
      dto.value.email = '';
      dto.value.password = '';
      await Get.defaultDialog(title: 'Success', content: const Text('Succesfuly created account'));
      Get.toNamed('/login');
      return;
    }

    handleErrorFirebaseResponse(result);
  }
}