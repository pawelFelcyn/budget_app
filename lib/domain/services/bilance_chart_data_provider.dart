import 'package:budget_app/data/charts/bilance_chart_data.dart';
import 'package:budget_app/data/charts/bilance_chart_data_result.dart';
import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/data/charts/groupped_bilance_chart_data.dart';
import 'package:budget_app/domain/services/expense_service.dart';
import 'package:budget_app/domain/services/incom_service.dart';
import 'package:intl/intl.dart';

class BilanceChartDataProvider{
  final ExpenseService _expenseService;
  final IncomService _incomService;

  BilanceChartDataProvider(this._expenseService, this._incomService);

  Future<BilanceChartDataResult> getData(int months) async{
    final from = getDateMonthsAgo(months);
    final now = DateTime.now();

    final expensesResult  = await _expenseService.getAllExpenses(from, now, null);

    if (!expensesResult.isSucces){
      return BilanceChartDataResult.failure();
    }

    final incomsResult  = await _incomService.getAllIncoms(from, now, null);

    if (!incomsResult.isSucces){
      return BilanceChartDataResult.failure();
    }

    final output = <BilanceChartData>[];

    final int interationFinishMonth = now.month < 13 ? now.month + 1 : 1;
    final int interationFinishYear = now.month < 13 ? now.year : now.year + 1;
    int year = from.year;
    int month = from.month;
    
    while (year != interationFinishYear || month != interationFinishMonth){
      final expensesSum = expensesResult.getContentUnsafe()
      .where((element) => element.craetedAt.year == year && element.craetedAt.month == month)
      .fold(0.0, (previousValue, element) => previousValue + element.cost);

      final incomsSum = incomsResult.getContentUnsafe()
      .where((element) => element.craetedAt.year == year && element.craetedAt.month == month)
      .fold(0.0, (previousValue, element) => previousValue + element.amount);

      String label = DateFormat('MMMM yyyy').format(DateTime(year, month));
      output.add(BilanceChartData(label, incomsSum, expensesSum));

      if (month < 12){
        month++;
        continue;
      }

      month = 1;
      year++;
    }
    return BilanceChartDataResult.successful(output);
  }

  DateTime getDateMonthsAgo(int months) {
    DateTime currentDate = DateTime.now();
    int currentMonth = currentDate.month;
    int currentYear = currentDate.year;
  
    int targetMonth = (currentMonth - months + 1) % 12;
    int targetYear = currentYear + (currentMonth - months + 1 - targetMonth) ~/ 12;
  
    String targetDateString = '$targetYear-${targetMonth.toString().padLeft(2, '0')}-01';
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.parse(targetDateString);
  }

  GrouppedBilanceChartData group(List<BilanceChartData> data){
    double incoms = 0;
    double expenses = 0;

    for (final monthData in data){
      incoms += monthData.incoms;
      expenses += monthData.expenses;
    }

    return GrouppedBilanceChartData(ChartData("Incoms", incoms), ChartData("Expenses", expenses));
  }
}