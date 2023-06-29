import 'package:budget_app/domain/services/chart_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts/chart_data.dart';
import '../utils/styles.dart';
import 'date_filter_selection_dropdown.dart';

class PieChartView extends StatefulWidget{
  final ChartDataProvider _dataProvider;
  final String title;

  const PieChartView(this._dataProvider, {super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PieChartViewState(_dataProvider, title);
  }
}

class PieChartViewState extends State<PieChartView>{
  final ChartDataProvider _dataProvider;
  List<ChartData> chartData = [];
  final String title;

  PieChartViewState(this._dataProvider, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title, style: Styles.captionStyle),
                DateFilterSelectionDropdown(onDateRangeChanged: (from, to) async{
                  chartData = (await _dataProvider.getChartData(from, to)).data;
                  setState((){});
                }),
                Expanded(
                  child: SfCircularChart(
                    legend: const Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      orientation: LegendItemOrientation.vertical,
                      ),
                    series: [
                    PieSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (data, _) =>data.label,
                      yValueMapper: (data, _) => data.amount,
                      dataLabelSettings: const DataLabelSettings(isVisible: true,)
                    )
                  ],),
                ),
              ],
            ),
          );
  }
}