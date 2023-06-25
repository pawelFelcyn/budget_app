import '../../data/charts/chart_data.dart';

abstract class ChartDataProvider{
  Future<List<ChartData>> getChartData(DateTime from, DateTime to);
}