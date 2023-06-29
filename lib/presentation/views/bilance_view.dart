import 'package:budget_app/data/charts/bilance_chart_data.dart';
import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/domain/services/bilance_chart_data_provider.dart';
import 'package:budget_app/presentation/views/months_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/styles.dart';

class BilanceView extends StatefulWidget{
  final BilanceChartDataProvider _dataProvider;

  const BilanceView(this._dataProvider, {super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _BilanceViewState(_dataProvider);
  }
}

class _BilanceViewState extends State<BilanceView>{
  final BilanceChartDataProvider _dataProvider;
  List<BilanceChartData> _chartData = [];
  
  _BilanceViewState(this._dataProvider);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Text('Bilance', style: Styles.captionStyle,),
        MonthsDropdown((months) async {
          _chartData = (await _dataProvider.getData(months)).data;
          setState(() {});
         }),
         SfCartesianChart(
          legend: const Legend(
            isVisible: true,
            position: LegendPosition.bottom
          ),
          primaryXAxis: CategoryAxis(),
          series: <ColumnSeries>[
            ColumnSeries<BilanceChartData, String>(
              dataSource: _chartData, 
              xValueMapper: (data, _) => data.monthLabel, 
              yValueMapper: (data, _) => data.incoms,
              name: "Incoms"
            ),
            ColumnSeries<BilanceChartData, String>(
              dataSource: _chartData, 
              xValueMapper: (data, _) => data.monthLabel, 
              yValueMapper: (data, _) => data.expenses,
              name: "Expenses"
            )
          ]
         ),
         SfCircularChart(
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: _dataProvider.group(_chartData).toList(),
              xValueMapper: (data,_) => data.label, 
              yValueMapper: (data,_) => data.amount,
              dataLabelSettings: const DataLabelSettings(isVisible: true,)
            )
          ],
         )
      ]),
    );
  }
}