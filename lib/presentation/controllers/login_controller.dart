import 'package:budget_app/data/dtos/login_dto.dart';
import 'package:budget_app/domain/services/login_service.dart';
import 'package:budget_app/domain/validators/login_dto_validator.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../domain/validators/validator.dart';

class LoginController extends ControllerBase{
  final Validator<LoginDto> validator = LoginDtoValidator();
  final LoginService service = LoginService();
  final Rx<LoginDto> dto = LoginDto().obs;

  void goToRegistration(){
    Get.toNamed('/login/register');
  }

  void login() async {
    if (!validate(dto.value, validator)){
      return;
    }

    var response = await service.login(dto.value);

    if (response.isSucces){
      Get.toNamed('/home');
    }

    handleErrorFirebaseResponse(response);
  }
}