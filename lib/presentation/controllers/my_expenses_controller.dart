import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyExpensesController extends ControllerBase{
  final RxList<ExpenseDto> expenses = <ExpenseDto>[
    ExpenseDto(title: 'First expense', cost: 20),
    ExpenseDto(title: 'Second exense', cost: 10.5),
    ExpenseDto(title: 'Third expense', cost: 5)
  ].obs;
}