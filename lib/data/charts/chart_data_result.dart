import 'chart_data.dart';

class ChartDataResult{
  final List<ChartData> data;
  final bool success;

  ChartDataResult(this.data, this.success);

  static ChartDataResult failure() => ChartDataResult([], false);
  static ChartDataResult successful(List<ChartData> data) => ChartDataResult(data, true);
}