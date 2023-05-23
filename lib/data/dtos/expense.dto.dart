class ExpenseDto{
  final String title;
  final double cost;
  final String? description;

  ExpenseDto({required this.title, required this.cost, this.description});
}