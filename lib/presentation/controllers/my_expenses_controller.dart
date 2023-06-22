import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get.dart';

class MyExpensesController extends ControllerBase{
  final RxList<ExpenseDto> expenses = <ExpenseDto>[].obs;
  final ExpenseService _service;

  MyExpensesController(this._service);

  void goToDetailsPage(ExpenseDto dto){
    Get.toNamed('/myexpenses/details', arguments: dto);
  }

  void goToCreateNewView(){
    Get.toNamed('/myexpenses/create');
  }

  void loadExpenses() async{
    expenses.clear();
    var expensesFromFirebase = await _service.getAllExpenses();
    for (int i = 0; i < expensesFromFirebase.length; i++){
      expenses.add(expensesFromFirebase[i]);
    }
  }
}