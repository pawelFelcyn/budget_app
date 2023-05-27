class ExpenseDto{
  final String title;
  final double cost;
  final String? description;
  final DateTime craetedAt;

  ExpenseDto({required this.title, required this.cost, this.description, required this.craetedAt});

  static ExpenseDto createdNow(String title, double cost, {String? description}){
    return ExpenseDto(title: title, cost: cost, description: description, craetedAt: DateTime.now());
  }
}