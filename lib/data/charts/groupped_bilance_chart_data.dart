import 'chart_data.dart';

class GrouppedBilanceChartData{
  final ChartData incoms;
  final ChartData expenses;

  GrouppedBilanceChartData(this.incoms, this.expenses);

  List<ChartData> toList(){
    return [
      incoms, expenses
    ];
  }
}