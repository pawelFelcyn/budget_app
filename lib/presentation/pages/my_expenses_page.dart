import 'package:flutter/material.dart';

import '../views/nav_bar.dart';

class MyExpensesPage extends StatelessWidget{
  MyExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My expenses'),
      ),
      body: const Text('This is home page'));
  }

}