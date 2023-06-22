import 'package:budget_app/presentation/controllers/create_expense_controller.dart';
import 'package:budget_app/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  child: TextField(
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
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: TextField(
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
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: TextField(
                    minLines: 7,
                    maxLines: 7,
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