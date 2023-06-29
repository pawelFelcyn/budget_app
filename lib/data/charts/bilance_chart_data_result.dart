import 'bilance_chart_data.dart';

class BilanceChartDataResult{
  final List<BilanceChartData> data;
  final bool success;

  BilanceChartDataResult(this.data, this.success);

  static BilanceChartDataResult failure() => BilanceChartDataResult([], false);
  static BilanceChartDataResult successful(List<BilanceChartData> data) => BilanceChartDataResult(data, true);
}