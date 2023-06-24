import 'package:budget_app/data/dtos/incom_category.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomCategoryDropdown extends StatefulWidget{
  final void Function(IncomCategory?) onCategoryChanged;
  final bool allowNull;

  const IncomCategoryDropdown({super.key, required this.onCategoryChanged, this.allowNull = false});
  
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _IncomCategoryDropdownState(onCategoryChanged, allowNull);
  }
}

class _IncomCategoryDropdownState extends State<IncomCategoryDropdown>{
  late IncomCategory? _selctedCategory;
  final void Function(IncomCategory?) onCategoryChanged;
  late List<IncomCategory?> _allCategories;
  final bool allowNull;
  late IncomCategoryMapper _mapper;

  _IncomCategoryDropdownState(this.onCategoryChanged, this.allowNull){
    _mapper = Get.find<IncomCategoryMapper>();
    _allCategories = _getAllCateogries();
    _selctedCategory = _allCategories[0];
  }

  List<IncomCategory?> _getAllCateogries(){
    if (allowNull){
      return <IncomCategory?>[null] + IncomCategory.values;
    }
    return IncomCategory.values;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selctedCategory,
      isExpanded: true,
      items: _allCategories.map<DropdownMenuItem<IncomCategory>>((value){
        return DropdownMenuItem<IncomCategory>(
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

  void _updateSelectedCategory(IncomCategory? newCategory){
    _selctedCategory = newCategory;
    onCategoryChanged(_selctedCategory);
  }

}