import 'package:budget_app/presentation/controllers/create_expense_controller.dart';
import 'package:budget_app/presentation/utils/styles.dart';
import 'package:budget_app/presentation/views/expense_category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CreateExpensePage extends GetView<CreateExpenseController>{
  const CreateExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create expense')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Column(
              children: [
                Text('Enter your expense data', style: Styles.captionStyle,),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: GetX<CreateExpenseController>(
                    builder: (ctrl) => 
                    Column(
                      children: [
                        TextField(
                          onChanged: (value){
                            controller.dto.value.title = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.5
                              )
                            )
                          ),
                        ),
                        ctrl.getErrorWidget(ctrl.validationResult.value, 'title')
                      ],
                    ),),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: GetX<CreateExpenseController>(
                    builder: 
                    (ctrl) => 
                    Column(
                      children: [
                        TextField(
                          onChanged: (value){
                            if (value == ''){
                              controller.dto.value.cost = 0;
                              return;
                            }
                            controller.dto.value.cost = double.parse(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(controller.costRegex)
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Cost',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.5
                              )
                            )
                          ),
                        ),
                        ctrl.getErrorWidget(ctrl.validationResult.value, 'cost')
                      ],
                    ),),
                ),
                const SizedBox(height: 10,),
                SizedBox(width: 300,
                  child: Expanded(
                    child: ExpenseCategoryDropdown(onCategoryChanged: (category){
                      if (category != null){
                        controller.dto.value.category = category;
                      }
                    }),
                  ),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: GetX<CreateExpenseController>(
                    builder: 
                    (ctrl) => 
                    Column(
                      children: [
                        TextField(
                        minLines: 4,
                        maxLines: 4,
                          onChanged: (value){
                            controller.dto.value.description = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.5
                              )
                            )
                          ),
                        ),
                        ctrl.getErrorWidget(ctrl.validationResult.value, 'description')
                      ],
                    ),),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: Expanded(
                    child: TextButton(
                    onPressed: controller.submit, 
                    style: Styles.primaryButtonStyle,
                    child: const Text('Submit', style: TextStyle(color: Colors.white))
                    ),
                  )
                )
              ],),
            ]
          ),
        ),
      )
    );
  }
}