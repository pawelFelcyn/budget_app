import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  late ExpenseCategoryMapper _mapper;

  _ExpenseCategoryDropdownState(this.onCategoryChanged, this.allowNull){
    _mapper = Get.find<ExpenseCategoryMapper>();
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
          child: Text(_mapper.toDisplayString(value)));
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

  void _updateSelectedCategory(ExpenseCategory? newCategory){
    _selctedCategory = newCategory;
    onCategoryChanged(_selctedCategory);
  }

}