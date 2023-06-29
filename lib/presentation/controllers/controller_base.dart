import 'package:budget_app/data/responses/firebase_response.dart';
import 'package:budget_app/domain/validators/validation_result.dart';
import '../../domain/validators/validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../views/error_popup.dart';

abstract class ControllerBase extends GetxController{
  Rx<bool> isBusy = false.obs;

  bool validate<T>(T model, Validator<T> validator){
    var validationResult = validator.validate(model);

    if (!validationResult.isSuccess){
      var sb = StringBuffer();

      for (int i = 0; i < validationResult.errors.length; i++){
        sb.write(validationResult.errors[i].message);
        sb.write(" ");
      }
      Get.defaultDialog(title: 'Error', content: Text(sb.toString()));
      return false;
    }

    return true;
  }

  void handleErrorFirebaseResponse(FirebaseResponse response){
    if (response.errorOccured){
      Get.defaultDialog(title: 'Error', content: _getErrorPopupWidget(response));
    }
  }

  Widget _getErrorPopupWidget(FirebaseResponse response){
    if (response.errorMessage != null){
      return Text(response.errorMessage as String);
    }

    return ErrorPopup(response.error.toString());
  }

  Widget getErrorWidget(ValidationResult result, String propertyName){
    var error = result.getErrorForProperty(propertyName);

    if (error == null){
      return Container();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(error.message, style: Styles.errorStyle,)
    );
  }

  Future<bool> showConfirmationDialog(String title, String message) async{
    bool selection = false;
    await Get.dialog<bool>(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              selection = false;
              Get.back(result: false);
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              selection = true;
              Get.back(result: true);
            },
          ),
        ],
      ),
    );

    return selection;
  }
}