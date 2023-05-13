import 'package:budget_app/data/responses/firebase_response.dart';
import '../../domain/validators/validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../views/error_popup.dart';

abstract class ControllerBase extends GetxController{
  bool validate<T>(T model, Validator<T> validator){
    var validationResult = validator.validate(model);

    if (!validationResult.isSuccess){
      Get.defaultDialog(title: 'Error', content: Text(validationResult.errors ?? ''));
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
}