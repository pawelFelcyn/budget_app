import 'package:budget_app/data/dtos/create_incom_dto.dart';
import 'package:budget_app/domain/services/incom_service.dart';
import 'package:budget_app/domain/validators/create_incom_dto_validator.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get.dart';

class CreateIncomController extends ControllerBase{
  final Rx<CreateIncomDto> dto = CreateIncomDto().obs;
  Rx<ValidationResult> validationResult = ValidationResult([]).obs;
  final RegExp amountRegex = RegExp(r'^\d+\.?\d{0,2}$');
  final CreateIncomDtoValidator _validator;
  final IncomService _service;

  CreateIncomController(this._validator, this._service);

  void submit() async{
    validationResult.value = _validator.validate(dto.value);
    if (!validationResult.value.isSuccess){
      return;
    }

    var response = await _service.createIncom(dto.value);

    if (!response.isSucces){
      handleErrorFirebaseResponse(response);
      return;
    }

    Get.back();
  }
}