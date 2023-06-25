import 'package:budget_app/presentation/views/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          Text('expesnses'),
          Text('Incoms'),
          Text('balance')
        ]),)
      );
  }
}