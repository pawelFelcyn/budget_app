import 'package:budget_app/domain/services/bilance_chart_data_provider.dart';
import 'package:budget_app/domain/services/expenses_chart_data_provider.dart';
import 'package:budget_app/domain/services/incoms_chart_data_provider.dart';
import 'package:budget_app/presentation/controllers/pie_chart_view_controller.dart';
import 'package:budget_app/presentation/views/bilance_view.dart';
import 'package:budget_app/presentation/views/nav_bar.dart';
import 'package:budget_app/presentation/views/pie_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AnalysisPage extends StatelessWidget{
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Analysis'),
          bottom: const TabBar(tabs: [
            Tab(child: Icon(FontAwesomeIcons.shoppingCart),),
            Tab(child: Icon(FontAwesomeIcons.handHoldingUsd),),
            Tab(child: Icon(FontAwesomeIcons.balanceScale,))
          ]),
        ),
        body: TabBarView(children: [
          PieChartView(Get.find<PieChartViewController>(tag: 'expensesPieChartViewController')),
          PieChartView(Get.find<PieChartViewController>(tag: 'incomsPieChartViewController')),
          BilanceView(Get.find<BilanceChartDataProvider>())
        ]),)
      );
  }
}