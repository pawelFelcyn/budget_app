import 'package:budget_app/data/charts/bilance_chart_data.dart';
import 'package:budget_app/data/charts/chart_data.dart';
import 'package:budget_app/presentation/views/months_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/bilance_controller.dart';
import '../utils/styles.dart';

class BilanceView extends StatelessWidget{
  final BilanceController _controller;

  const BilanceView(this._controller, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Text('Bilance', style: Styles.captionStyle,),
        MonthsDropdown((months) {
          _controller.months = months;
         }),
         Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: _controller.loadChartData,
                style: Styles.primaryButtonStyle,
                child: Obx(() => Styles.reloadButtonContent(_controller)),
              ),
            ),
          ],
        ),
        Obx(() => 
          Expanded(
            child: _getMainContent()
          ))
      ]),
    );
  }

  Widget _getMainContent(){
    if (!_controller.dataLoadedMinOnce.value || _controller.isBusy.value){
      return Container();
    }

    if (!_controller.dataResut.value.success){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('There was a problem on loading chart data.',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    if (_controller.dataResut.value.data.isEmpty){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('No data availible in selected date range',
          style: TextStyle(color: Colors.blueAccent),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(children: [
        SfCartesianChart(
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom
            ),
            primaryXAxis: CategoryAxis(),
            series: <ColumnSeries>[
              ColumnSeries<BilanceChartData, String>(
                dataSource: _controller.dataResut.value.data, 
                xValueMapper: (data, _) => data.monthLabel, 
                yValueMapper: (data, _) => data.incoms,
                name: "Incoms"
              ),
              ColumnSeries<BilanceChartData, String>(
                dataSource: _controller.dataResut.value.data, 
                xValueMapper: (data, _) => data.monthLabel, 
                yValueMapper: (data, _) => data.expenses,
                name: "Expenses"
              )
            ]
           ),
           SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: _controller.getGroupedChartData(),
                xValueMapper: (data,_) => data.label, 
                yValueMapper: (data,_) => data.amount,
                dataLabelSettings: const DataLabelSettings(isVisible: true,)
              )
            ],
           )
      ],),
    );
  }
}