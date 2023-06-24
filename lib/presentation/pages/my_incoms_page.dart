import 'package:flutter/material.dart';

import '../views/nav_bar.dart';

class MyIncomsPage extends StatelessWidget{
  const MyIncomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My incoms'),
      ),
      body: Text('incoms page'),
    );
  }

}