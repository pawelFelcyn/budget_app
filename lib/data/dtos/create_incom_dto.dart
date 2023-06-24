import 'package:budget_app/data/dtos/incom_category.dart';

class CreateIncomDto{
    String title = '';
    String description = '';
    double amount = 0;
    IncomCategory category = IncomCategory.salary;
}