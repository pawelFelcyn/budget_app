import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';

class Styles{
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    overlayColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.green)
      )
    )
  );

  static ButtonStyle deleteButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    overlayColor: MaterialStateProperty.all<Color>(Colors.red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.red)
      )
    )
  );


  static ButtonStyle secondaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    overlayColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.green)
      )
    )
  );

  static ButtonStyle flyoutActionButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 240, 240, 240))
  );

  static TextStyle captionStyle = const TextStyle(
    fontSize: 25,
    color: Colors.blueAccent
  );

  static TextStyle errorStyle = const TextStyle(
    color: Colors.red
  );

  static Widget reloadButtonContent(ControllerBase controller){
    if (controller.isBusy.value){
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