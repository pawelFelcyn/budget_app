import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateFilterSelectionDropdown extends StatefulWidget{

  final void Function(DateTime, DateTime) onDateRangeChanged;
  const DateFilterSelectionDropdown({super.key, required this.onDateRangeChanged});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _DateFilterSelectionDropdownState(onDateRangeChanged: onDateRangeChanged);
  }
}

class _DateFilterSelectionDropdownState extends State<DateFilterSelectionDropdown>{
  final List<String> _dateFilterOptions = [
    "Current week",
    "Current month",
    "Current year",
    "Custom"
  ];
  late String _selectedOption;
  DateTime _customStartDate = DateTime.now();
  DateTime _customEndDate = DateTime.now();
  void Function(DateTime, DateTime) onDateRangeChanged;

 _DateFilterSelectionDropdownState({required this.onDateRangeChanged}){
  _selectedOption = _dateFilterOptions[0];
  _calculateDateRange();
 }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Date: ', style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
        Expanded(
          child: DropdownButton(
              value: _selectedOption,
              isExpanded: true,
              items: _dateFilterOptions
                .map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(
                   value: value,
                   child: _getDateFilterDropdownItem(value, context),
                 );
               }).toList(),
               onChanged: (v) {
                 setState(() {
                   if (v != null){
                   _selectedOption = v;
                   _calculateDateRange();
                 }
                 });
               }),
        ),
      ],
    );
  }

  Widget _getDateFilterDropdownItem(String selection, BuildContext context) {
    if (selection != "Custom"){
      return Text(selection);
    }

    return Row(children: [
      Text(selection),
      const SizedBox(width: 10,),
      TextButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
          maxTime: DateTime.now(),
          onConfirm: (time) {
            setState(() {
              _customStartDate = DateTime(time.year, time.month, time.day, 0, 0);
              _calculateDateRange();
            });
          },);
        },
        child: Text('From: ${DateFormat('dd.MM.yy').format(_customStartDate)}', 
          style: const TextStyle(color: Colors.blueAccent),)
        ),
      const SizedBox(width: 10,),
      TextButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
          maxTime: DateTime.now(),
          onConfirm: (time) {
            setState(() {
              _customEndDate = DateTime(time.year, time.month, time.day, 23, 59);
              _calculateDateRange();
            });
          },);
        },
        child: Text('To: ${DateFormat('dd.MM.yy').format(_customStartDate)}',
           style: const TextStyle(color: Colors.blueAccent),)
        ),
      const SizedBox(width: 10,)
    ],); 
  }
  
  void _calculateDateRange() {
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();
    if (_selectedOption == "Current week"){
      startDate = _getCurrentWeekStartDate();
    } else if (_selectedOption == "Current month"){
      startDate = _getCurrentMonthStartDate();
    } else if (_selectedOption == "Current year"){
      startDate = _getCurrentYearStartDate();
    } else if (_selectedOption == "Custom"){
      startDate = _customStartDate;
      endDate = _customEndDate;
    }

    onDateRangeChanged(startDate, endDate);
  }

  DateTime _getCurrentWeekStartDate() {
    DateTime currentDate = DateTime.now();
    int daysUntilMonday = currentDate.weekday - DateTime.monday;
    DateTime currentWeekStartDate = currentDate.subtract(Duration(days: daysUntilMonday));
    currentWeekStartDate = DateTime(currentWeekStartDate.year, currentWeekStartDate.month, currentWeekStartDate.day);
    return currentWeekStartDate;
  }

  DateTime _getCurrentMonthStartDate() {
    DateTime currentDate = DateTime.now();
    DateTime currentMonthStartDate = DateTime(currentDate.year, currentDate.month, 1);
    return currentMonthStartDate;
  }

  DateTime _getCurrentYearStartDate() {
    DateTime currentDate = DateTime.now();
    DateTime currentYearStartDate = DateTime(currentDate.year, 1, 1);
    return currentYearStartDate;
  }
}