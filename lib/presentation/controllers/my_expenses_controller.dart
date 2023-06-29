import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/dtos/expense_category.dart';

class MyExpensesController extends ControllerBase{
  final RxList<ExpenseDto> expenses = <ExpenseDto>[].obs;
  final ExpenseService _service;
  final ExpenseCategoryMapper _expenseCategoryMapper;
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();
  ExpenseCategory? filterCategory;
  Rx<bool> firebaseFailed = false.obs;

  String selectedDateFilterOption = "Current week";
  MyExpensesController(this._service, this._expenseCategoryMapper);

  void goToDetailsPage(ExpenseDto dto){
    Get.toNamed('/myexpenses/details', arguments: dto);
  }

  void goToCreateNewView(){
    Get.toNamed('/myexpenses/create');
  }

  void loadExpenses() async{
    expenses.clear();
    var expensesResult = await _service.getAllExpenses(dateFrom, dateTo, filterCategory);

    if (!expensesResult.isSucces){
      firebaseFailed.value = true;
      return;
    }

    firebaseFailed.value = false;
    for (final expense in expensesResult.getContentUnsafe()){
      expenses.add(expense);
    }
  }

  IconData getCategoryIcon(ExpenseCategory category){
    return _expenseCategoryMapper.toIcon(category);
  }
}