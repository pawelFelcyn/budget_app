import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/domain/services/login_service.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../domain/validators/validator.dart';

class LoginController extends ControllerBase{
  final Validator<LoginDto> _validator;
  final LoginService service;
  final Rx<LoginDto> dto = LoginDto().obs;
  final Rx<ValidationResult> validationResult = ValidationResult([]).obs;

  LoginController(this.service, this._validator);

  void goToRegistration(){
    Get.toNamed('/login/register');
  }

  void login() async {
    validationResult.value = _validator.validate(dto.value);
    if (!validationResult.value.isSuccess){
      return;
    }

    var response = await service.login(dto.value);
    dto.value.email = '';
    dto.value.password = '';
    if (response.isSucces){
      Get.toNamed('/myexpenses');
    }

    handleErrorFirebaseResponse(response);
  }
}