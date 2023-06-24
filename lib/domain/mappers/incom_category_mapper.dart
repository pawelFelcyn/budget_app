import 'package:budget_app/data/dtos/incom_category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncomCategoryMapper{
  String toDisplayString(IncomCategory? category){
    switch (category){
      case IncomCategory.salary:
        return "Salary";
      case IncomCategory.sale:
        return "Sale";
      case IncomCategory.capitalGains:
        return "Capital gains";
      case IncomCategory.other:
        return "Other";
      case null:
        return "Any";
    }
  }

  IconData toIcon(IncomCategory category){
     switch (category){
      case IncomCategory.salary:
        return FontAwesomeIcons.wallet;
      case IncomCategory.sale:
        return FontAwesomeIcons.tag;
      case IncomCategory.capitalGains:
        return FontAwesomeIcons.chartLine;
      case IncomCategory.other:
        return FontAwesomeIcons.questionCircle;
    }
  }
}