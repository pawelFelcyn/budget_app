import 'package:budget_app/presentation/controllers/my_incoms_controller.dart';
import 'package:budget_app/presentation/pages/view_base.dart';
import 'package:budget_app/presentation/views/incom_category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../utils/styles.dart';
import '../views/date_filter_selection_dropdown.dart';
import '../views/nav_bar.dart';

class MyIncomsPage extends ViewBase<MyIncomsController>{
  const MyIncomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('My incoms'),
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
                  Expanded(child: IncomCategoryDropdown(onCategoryChanged: (value){controller.filterCategory = value;}, allowNull: true,))
                ],),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: controller.loadIncoms,
                        style: Styles.primaryButtonStyle,
                        child: GetX<MyIncomsController>(
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
                    child: GetX<MyIncomsController>(
                      builder: (ctrl) => _getMainContent(ctrl)
                    ),
                ),
              ),
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

  Widget _getMainContent(MyIncomsController ctrl){
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

    if (ctrl.incoms.isEmpty && ctrl.triedReloadMinimOnce.value){
      return const Align(
        alignment: Alignment.topCenter,
        child: Text('You have no incoms matching selected filters',
          style: TextStyle(color: Colors.blueAccent),),
      ); 
    }

    return Expanded(
      child: ListView.builder(
        itemCount: ctrl.incoms.length,
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
                      ctrl.incoms[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(ctrl.getCategoryIcon(ctrl.incoms[index].category), color: Colors.blueAccent,)
                        )
                      ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          controller.incoms[index].amount
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
                              controller.incoms[index]);
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            )),
    );
  }

}