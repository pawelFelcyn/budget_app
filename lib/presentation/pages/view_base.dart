import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

abstract class ViewBase<TController> extends GetView<TController>{
  const ViewBase({super.key});

  Widget getReloadButtonContent(ControllerBase ctrl){
    if (ctrl.isBusy.value){
      return const SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    return const Text(
      'Reload',
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}