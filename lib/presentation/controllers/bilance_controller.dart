import 'package:budget_app/data/charts/bilance_chart_data_result.dart';
import 'package:budget_app/domain/services/bilance_chart_data_provider.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../data/charts/chart_data.dart';

class BilanceController extends ControllerBase{
  final Rx<BilanceChartDataResult> dataResut = BilanceChartDataResult.failure().obs;
  final BilanceChartDataProvider _dataProvider;
  int months = 3;
  Rx<bool> dataLoadedMinOnce = false.obs;

  BilanceController(this._dataProvider);

  void loadChartData() async{
    if (isBusy.value){
      return;
    }

    try{
      isBusy.value = true;
      dataLoadedMinOnce.value = true;
      dataResut.value = await _dataProvider.getData(months);
    } finally{
      isBusy.value = false;
    }
  }

  List<ChartData> getGroupedChartData(){
    return _dataProvider.group(dataResut.value.data).toList();
  }
}