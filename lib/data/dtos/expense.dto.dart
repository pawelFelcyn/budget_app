import 'expense_category.dart';

class ExpenseDto{
  final String title;
  final double cost;
  final String? description;
  final DateTime craetedAt;
  final ExpenseCategory category;

  ExpenseDto({required this.title, required this.cost, this.description, required this.craetedAt, required this.category});

  static ExpenseDto createdNow(String title, double cost, {String? description, ExpenseCategory category = ExpenseCategory.general}){
    return ExpenseDto(title: title, cost: cost, description: description, craetedAt: DateTime.now(), category: category);
  }
}