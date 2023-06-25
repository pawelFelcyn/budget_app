import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/data/dtos/incom_category.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/domain/services/chart_data_provider.dart';
import 'package:budget_app/domain/services/incom_service.dart';

class IncomsChartDataProvider extends ChartDataProvider{
  final IncomService _service;
  final IncomCategoryMapper _mapper;

  IncomsChartDataProvider(this._service, this._mapper);

  @override
  Future<List<ChartData>> getChartData(DateTime from, DateTime to) async{
    var incoms = await _service.getAllIncoms(from, to, null);

    final Map<IncomCategory, double> groupedData = {};

    for (final incom in incoms){
      if (groupedData.containsKey(incom.category)){
        groupedData[incom.category] = (groupedData[incom.category] as double) + incom.amount;
        continue;
      }

      groupedData[incom.category] = incom.amount;
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