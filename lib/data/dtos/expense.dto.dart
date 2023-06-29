import 'expense_category.dart';

class ExpenseDto{
  final String title;
  final double cost;
  final String? description;
  final DateTime craetedAt;
  final ExpenseCategory category;
  final String id;

  ExpenseDto({required this.id, required this.title, required this.cost, this.description, required this.craetedAt, required this.category});

  static ExpenseDto createdNow(String id, String title, double cost, {String? description, ExpenseCategory category = ExpenseCategory.general}){
    return ExpenseDto(id: id, title: title, cost: cost, description: description, craetedAt: DateTime.now(), category: category);
  }
}