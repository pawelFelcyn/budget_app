import 'package:budget_app/data/dtos/expense_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseCategoryMapper{
  String toDisplayString(ExpenseCategory? category){
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

  IconData toIcon(ExpenseCategory category){
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