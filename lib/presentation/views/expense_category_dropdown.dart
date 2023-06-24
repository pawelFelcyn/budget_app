import 'package:flutter/material.dart';

import '../../data/dtos/expense_category.dart';

class ExpenseCategoryDropdown extends StatefulWidget{
  final void Function(ExpenseCategory) onCategoryChanged;

  const ExpenseCategoryDropdown({super.key, required this.onCategoryChanged});
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _ExpenseCategoryDropdownState(onCategoryChanged);
  }
}

class _ExpenseCategoryDropdownState extends State<ExpenseCategoryDropdown>{
  late ExpenseCategory _selctedCategory;
  final void Function(ExpenseCategory) onCategoryChanged;
  final _allCategories = ExpenseCategory.values;

  _ExpenseCategoryDropdownState(this.onCategoryChanged){
    _selctedCategory = ExpenseCategory.general;
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

  String _getDisplayValue(ExpenseCategory category){
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
      default:
        return "General";
    }
  }

  void _updateSelectedCategory(ExpenseCategory newCategory){
    _selctedCategory = newCategory;
    onCategoryChanged(_selctedCategory);
  }

}