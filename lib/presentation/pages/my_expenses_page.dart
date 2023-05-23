import 'package:budget_app/presentation/controllers/my_expenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../views/nav_bar.dart';

class MyExpensesPage extends StatelessWidget{
  MyExpensesController _controller = MyExpensesController();

  MyExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My expenses'),
      ),
      body: Row(
        children: [Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _controller.expenses.length,
                  itemBuilder: (context, index) =>
                    Row(
                      children: [
                        const Text('Expense')
                      ],
                    )
                  )
                ),
            ),
          ) 
          ),]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),),
    );
  }

}