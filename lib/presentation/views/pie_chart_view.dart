import 'package:budget_app/presentation/controllers/pie_chart_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/charts/chart_data.dart';
import '../utils/styles.dart';
import 'date_filter_selection_dropdown.dart';

class PieChartView extends StatelessWidget{
  final PieChartViewController _controller;

  const PieChartView(this._controller,  {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(_controller.title, style: Styles.captionStyle),
                DateFilterSelectionDropdown(onDateRangeChanged: (from, to){
                  _controller.dateFrom = from;
                  _controller.dateTo = to;
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
                )),
              ],
            ),
          );  
  }

   Widget _getMainContent(){
    if (!_controller.dataLoadedMinOnce.value || _controller.isBusy.value){
      return Container();
    }

    if (!_controller.chartData.value.success){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('There was a problem on loading chart data.',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    if (_controller.chartData.value.data.isEmpty){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('No data availible in selected date range',
          style: TextStyle(color: Colors.blueAccent),
        ),
      );
    }

    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        orientation: LegendItemOrientation.vertical,
        ),
      series: [
      PieSeries<ChartData, String>(
        dataSource: _controller.chartData.value.data,
        xValueMapper: (data, _) =>data.label,
        yValueMapper: (data, _) => data.amount,
        dataLabelSettings: const DataLabelSettings(isVisible: true,)
      )
    ],);
  }
}