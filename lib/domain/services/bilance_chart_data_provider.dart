import 'package:budget_app/data/charts/bilance_chart_data.dart';
import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/data/charts/groupped_bilance_chart_data.dart';

class BilanceChartDataProvider{
  Future<List<BilanceChartData>> getData(int months) async{
    return [
      BilanceChartData('January', 1000, 500),
      BilanceChartData('February', 1300, 100),
      BilanceChartData('March', 200, 800),
    ];
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