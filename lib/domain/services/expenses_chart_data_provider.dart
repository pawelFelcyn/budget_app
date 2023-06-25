import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/data/dtos/expense_category.dart';
import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:budget_app/domain/services/chart_data_provider.dart';
import 'package:budget_app/domain/services/expense_service.dart';

class ExpensesChartDataProvider extends ChartDataProvider{
  final ExpenseService _expenseService;
  final ExpenseCategoryMapper _mapper;

  ExpensesChartDataProvider(this._expenseService, this._mapper);

  @override
  Future<List<ChartData>> getChartData(DateTime from, DateTime to) async {
    var expenses = await _expenseService.getAllExpenses(from, to, null);

    final Map<ExpenseCategory, double> groupedData = {};

    for (final expense in expenses){
      if (groupedData.containsKey(expense.category)){
        groupedData[expense.category] = (groupedData[expense.category] as double) + expense.cost;
        continue;
      }

      groupedData[expense.category] = expense.cost;
    }

    final List<ChartData> output = [];

    for (final key in groupedData.keys){
      final String label = _mapper.toDisplayString(key);
      final double value = groupedData[key] as double;
      output.add(ChartData(label, value));
    }

    return output;
  }
}