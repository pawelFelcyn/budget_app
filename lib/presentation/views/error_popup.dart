import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPopup extends StatefulWidget{
  final String _exceptionDetails;
  const ErrorPopup(this._exceptionDetails, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ErrorPopupState(_exceptionDetails);
  }

}

class _ErrorPopupState extends State<ErrorPopup>{
  String _message = 'Something went wrong';
  final String _exceptionDetails;

  _ErrorPopupState(this._exceptionDetails);

  void _displayDetails(){
    setState(() {
      _message = _exceptionDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_message),
      TextButton(
        onPressed: _displayDetails, 
        child: const Text('Details'))
    ],);
  }

}