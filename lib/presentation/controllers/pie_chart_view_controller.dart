import 'package:budget_app/data/charts/chart_data_result.dart';
import 'package:budget_app/domain/services/chart_data_provider.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PieChartViewController extends ControllerBase{
  final String title;
  final ChartDataProvider _dataProvider;
  final Rx<ChartDataResult> chartData = ChartDataResult.failure().obs;
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();
  final Rx<bool> dataLoadedMinOnce = false.obs;

  PieChartViewController(this.title, this._dataProvider);

  void loadChartData() async{
    if (isBusy.value){
      return;
    }

    try{
      isBusy.value = true;
      dataLoadedMinOnce.value = true;
      chartData.value = await _dataProvider.getChartData(dateFrom, dateTo);
    } finally{
      isBusy.value = false;
    }
  }
}