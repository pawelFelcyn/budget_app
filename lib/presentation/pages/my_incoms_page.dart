import 'package:budget_app/presentation/controllers/my_incoms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../views/nav_bar.dart';

class MyIncomsPage extends GetView<MyIncomsComtroller>{
  const MyIncomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My incoms'),
      ),
      body: Text('incoms page'),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToCreateNewView,
        child: const Icon(Icons.add),
      ),
    );
  }

}