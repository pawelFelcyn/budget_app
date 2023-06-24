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
    color: Colors.green
  );

  static TextStyle errorStyle = const TextStyle(
    color: Colors.red
  );
}