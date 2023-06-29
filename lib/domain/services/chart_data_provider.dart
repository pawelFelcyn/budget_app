import '../../data/charts/chart_data_result.dart';

abstract class ChartDataProvider{
  Future<ChartDataResult> getChartData(DateTime from, DateTime to);
}