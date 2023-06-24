import 'package:flutter/material.dart';

import '../../data/dtos/expense_category.dart';

class ExpenseCategoryDropdown extends StatefulWidget{
  final void Function(ExpenseCategory?) onCategoryChanged;
  final bool allowNull;

  const ExpenseCategoryDropdown({super.key, required this.onCategoryChanged, this.allowNull = false});
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _ExpenseCategoryDropdownState(onCategoryChanged, allowNull);
  }
}

class _ExpenseCategoryDropdownState extends State<ExpenseCategoryDropdown>{
  late ExpenseCategory? _selctedCategory;
  final void Function(ExpenseCategory?) onCategoryChanged;
  late List<ExpenseCategory?> _allCategories;
  final bool allowNull;

  _ExpenseCategoryDropdownState(this.onCategoryChanged, this.allowNull){
    _allCategories = _getAllCateogries();
    _selctedCategory = _allCategories[0];
  }

  List<ExpenseCategory?> _getAllCateogries(){
    if (allowNull){
      return <ExpenseCategory?>[null] + ExpenseCategory.values;
    }
    return ExpenseCategory.values;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selctedCategory,
      isExpanded: true,
      items: _allCategories.map<DropdownMenuItem<ExpenseCategory>>((value){
        return DropdownMenuItem<ExpenseCategory>(
          value: value,
          child: Text(_getDisplayValue(value)));
      }).toList(), 
      onChanged: (value){
        setState(() {
          if (value != null){
            _updateSelectedCategory(value);
          }
        });
      }
      );
  }

  String _getDisplayValue(ExpenseCategory? category){
    switch (category){
      case ExpenseCategory.food:
        return "Food";
      case ExpenseCategory.hygiene:
        return "Hygiene";
      case ExpenseCategory.medicationAndDrugs:
        return "Medication and drugs";
      case ExpenseCategory.clothes:
        return "Clothes";
      case ExpenseCategory.entertainment:
        return "Entertainmnt";
      case ExpenseCategory.rent:
        return "Rent";
      case ExpenseCategory.general:
        return "General";
      case null:
      return "Any";
    }

  }

  void _updateSelectedCategory(ExpenseCategory? newCategory){
    _selctedCategory = newCategory;
    onCategoryChanged(_selctedCategory);
  }

}