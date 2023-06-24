import 'package:budget_app/data/dtos/incom_category.dart';

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
}