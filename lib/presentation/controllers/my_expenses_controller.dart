import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/dtos/expense_category.dart';

class MyExpensesController extends ControllerBase{
  final RxList<ExpenseDto> expenses = <ExpenseDto>[].obs;
  final ExpenseService _service;
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();

  String selectedDateFilterOption = "Current week";
  MyExpensesController(this._service);

  void goToDetailsPage(ExpenseDto dto){
    Get.toNamed('/myexpenses/details', arguments: dto);
  }

  void goToCreateNewView(){
    Get.toNamed('/myexpenses/create');
  }

  void loadExpenses() async{
    expenses.clear();
    var expensesFromFirebase = await _service.getAllExpenses(dateFrom, dateTo);
    for (int i = 0; i < expensesFromFirebase.length; i++){
      expenses.add(expensesFromFirebase[i]);
    }
  }

  IconData getCategoryIcon(ExpenseCategory category){
    switch (category){
      case ExpenseCategory.general:
        return FontAwesomeIcons.list;
      case ExpenseCategory.food:
        return FontAwesomeIcons.pizzaSlice;
      case ExpenseCategory.hygiene:
        return FontAwesomeIcons.soap;
      case ExpenseCategory.medicationAndDrugs:
        return FontAwesomeIcons.pills;
      case ExpenseCategory.clothes:
        return FontAwesomeIcons.tshirt;
      case ExpenseCategory.entertainment:
        return FontAwesomeIcons.gamepad;
      case ExpenseCategory.rent:
        return FontAwesomeIcons.home;
    }
  }
}