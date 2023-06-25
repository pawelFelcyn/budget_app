import 'package:flutter/material.dart';

class MonthsDropdown extends StatefulWidget{
  final void Function(int months) _onValueChanged;

  const MonthsDropdown(this._onValueChanged, {super.key});
  

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _MonthsDropdownState(_onValueChanged);
  }
}

class _MonthsDropdownState extends State<MonthsDropdown>{
  final List<int> _values = [3, 6, 12];
  final void Function(int months) _onValueChanged;
  int _selectedValue = 3;

  _MonthsDropdownState(this._onValueChanged);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: _selectedValue,
      isExpanded: true,
      items: _values.map<DropdownMenuItem<int>>((value){
         return DropdownMenuItem<int>(
          value: value,
          child: Text('$value months'));
      }).toList(), 
      onChanged: (value){
        if (value != null){
          _onValueChanged(value);
          setState(() {
            _selectedValue = value;
         });
       }
      }
    );
  }
}