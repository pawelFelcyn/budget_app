import 'package:budget_app/data/dtos/incom_category.dart';

class IncomDto{
  final String title;
  final double amount;
  final String? description;
  final DateTime craetedAt;
  final IncomCategory category;
  final String id;

  IncomDto({required this.id, required this.title, required this.amount, this.description, required this.craetedAt, required this.category});
}