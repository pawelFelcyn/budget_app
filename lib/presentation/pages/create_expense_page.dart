import 'package:budget_app/presentation/controllers/create_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CreateExpensePage extends GetView<CreateExpenseController>{
  const CreateExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create expense')
      ),
      body: const Text('test')
    );
  }
}