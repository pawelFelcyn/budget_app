import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/domain/mappers/expense_category_mapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/styles.dart';

class ExpenseDetailsPage extends StatelessWidget{
  const ExpenseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
     var expense = Get.arguments as ExpenseDto;
     var mapper = Get.find<ExpenseCategoryMapper>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: 
            [
              Row(
                children: [
                  Text('Title: ',
                  style: Styles.captionStyle) ,
                  Text(expense.title, style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('Created at: ',
                  style: Styles.captionStyle) ,
                  Text(DateFormat('dd.MM.yyyy HH:mm').format(expense.craetedAt), style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('Cost: ',
                  style: Styles.captionStyle) ,
                  Text(expense.cost.toString(), style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(children: [
                Text('Category: ', style: Styles.captionStyle,),
                Text('${mapper.toDisplayString(expense.category)} ', style: const TextStyle(fontSize: 20),),
                Icon(mapper.toIcon(expense.category), color: Colors.blueAccent)
              ],),
              const SizedBox(height: 5,),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Description:', style: Styles.captionStyle,)
                ),
              const SizedBox(height: 5,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(expense.description ?? '', style: const TextStyle(fontSize: 20))
              )
            ],),
        ),
      )
    );
  }

}