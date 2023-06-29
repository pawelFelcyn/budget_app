import 'expense_category.dart';

class ExpenseDto{
  final String title;
  final double cost;
  final String? description;
  final DateTime craetedAt;
  final ExpenseCategory category;
  final String id;

  ExpenseDto({required this.id, required this.title, required this.cost, this.description, required this.craetedAt, required this.category});
}