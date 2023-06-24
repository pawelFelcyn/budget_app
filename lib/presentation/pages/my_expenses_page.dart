import 'package:budget_app/presentation/controllers/my_expenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../utils/styles.dart';
import '../views/date_filter_selection_dropdown.dart';
import '../views/nav_bar.dart';

class MyExpensesPage extends GetView<MyExpensesController> {
  const MyExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My expenses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DateFilterSelectionDropdown(onDateRangeChanged: (start, end) {
                        controller.dateFrom = start;
                        controller.dateTo = end;
                      },),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: controller.loadExpenses,
                        style: Styles.primaryButtonStyle,
                        child: const Text(
                          'Reload',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: controller.expenses.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 27, 99, 30),
                                    width: 2,
                                  )),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    controller.expenses[index].title,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(controller.getCategoryIcon(controller.expenses[index].category), color: Colors.blueAccent,)
                                      )
                                    ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        controller.expenses[index].cost
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.green),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      style: Styles.primaryButtonStyle,
                                      child: const Text(
                                        'Details',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        controller.goToDetailsPage(
                                            controller.expenses[index]);
                                      },
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ))),
                ),
              )),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToCreateNewView,
        child: const Icon(Icons.add),
      ),
    );
  }

  
}
