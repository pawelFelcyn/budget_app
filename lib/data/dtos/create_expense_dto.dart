import 'package:budget_app/data/dtos/expense_category.dart';

class CreateExpenseDto{
    String title = '';
    String description = '';
    double cost = 0;
    ExpenseCategory category = ExpenseCategory.general;
}