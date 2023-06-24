import 'package:budget_app/presentation/controllers/create_incom_controller.dart';
import 'package:budget_app/presentation/views/incom_category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class CreateIncomPage extends GetView<CreateIncomController>{
  const CreateIncomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create incom')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Column(
              children: [
                Text('Enter your incom data', style: Styles.captionStyle,),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: GetX<CreateIncomController>(
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
                  child: GetX<CreateIncomController>(
                    builder: 
                    (ctrl) => 
                    Column(
                      children: [
                        TextField(
                          onChanged: (value){
                            if (value == ''){
                              controller.dto.value.amount = 0;
                              return;
                            }
                            controller.dto.value.amount = double.parse(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(controller.amountRegex)
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Amount',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1.5
                              )
                            )
                          ),
                        ),
                        ctrl.getErrorWidget(ctrl.validationResult.value, 'amount')
                      ],
                    ),),
                ),
                const SizedBox(height: 10,),
                SizedBox(width: 300,
                  child: Expanded(
                    child: IncomCategoryDropdown(onCategoryChanged: (category){
                      if (category != null){
                        controller.dto.value.category = category;
                      }
                    }),
                  )
                  ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: GetX<CreateIncomController>(
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