import 'package:budget_app/presentation/views/nav_bar.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget{
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Analysis'),
      ),
      body: const Text('Analysis'),
    );
  }
}