import 'package:budget_app/presentation/controllers/my_expenses_controller.dart';
import 'package:budget_app/presentation/pages/view_base.dart';
import 'package:budget_app/presentation/views/expense_category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../utils/styles.dart';
import '../views/date_filter_selection_dropdown.dart';
import '../views/nav_bar.dart';

class MyExpensesPage extends ViewBase<MyExpensesController> {
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
                Row(children: [
                  const Text('Category: ', style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
                  Expanded(child: ExpenseCategoryDropdown(onCategoryChanged: (value){controller.filterCategory = value;}, allowNull: true,))
                ],),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: controller.loadExpenses,
                        style: Styles.primaryButtonStyle,
                        child: GetX<MyExpensesController>(
                          builder: (ctrl) => getReloadButtonContent(ctrl)
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
                  child: GetX<MyExpensesController>(
                    builder: (ctrl) => _getMainContent(ctrl)
                  ),
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

  Widget _getMainContent(MyExpensesController ctrl){
    if (ctrl.isBusy.value){
      return Container();
    }

    if (ctrl.firebaseFailed.value){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('There was some problem when loading data',
          style: TextStyle(color: Colors.red),),
      );
    }

    if (ctrl.expenses.isEmpty && ctrl.triedReloadMinimOnce.value){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('You have no incoms matching selected filters',
          style: TextStyle(color: Colors.blueAccent),),
      ); 
    }

    return Expanded(
      child: ListView.builder(
        itemCount: ctrl.expenses.length,
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
                      ctrl.expenses[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(ctrl.getCategoryIcon(ctrl.expenses[index].category), color: Colors.blueAccent,)
                        )
                      ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ctrl.expenses[index].cost
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
                          ctrl.goToDetailsPage(ctrl.expenses[index]);
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ))
    );
  }
}
