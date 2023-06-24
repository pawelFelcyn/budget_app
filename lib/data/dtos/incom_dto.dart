import 'package:budget_app/data/dtos/incom_category.dart';

class IncomDto{
  final String title;
  final double amount;
  final String? description;
  final DateTime craetedAt;
  final IncomCategory category;

  IncomDto({required this.title, required this.amount, this.description, required this.craetedAt, required this.category});

  static IncomDto createdNow(String title, double amount, {String? description, IncomCategory category = IncomCategory.salary}){
    return IncomDto(title: title, amount: amount, description: description, craetedAt: DateTime.now(), category: category);
  }
}