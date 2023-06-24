import 'package:budget_app/data/dtos/incom_dto.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/styles.dart';

class IncomDetailsPage extends StatelessWidget{
  const IncomDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
     var incom = Get.arguments as IncomDto;
     var mapper = Get.find<IncomCategoryMapper>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incom details'),
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
                  Text(incom.title, style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('Created at: ',
                  style: Styles.captionStyle) ,
                  Text(DateFormat('dd.MM.yyyy HH:mm').format(incom.craetedAt), style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('Cost: ',
                  style: Styles.captionStyle) ,
                  Text(incom.amount.toString(), style: const TextStyle(fontSize: 20),)             
                ],),
              const SizedBox(height: 5,),
              Row(children: [
                Text('Category: ', style: Styles.captionStyle,),
                Text('${mapper.toDisplayString(incom.category)} ', style: const TextStyle(fontSize: 20),),
                Icon(mapper.toIcon(incom.category), color: Colors.blueAccent)
              ],),
              const SizedBox(height: 5,),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Description:', style: Styles.captionStyle,)
                ),
              const SizedBox(height: 5,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(incom.description ?? '', style: const TextStyle(fontSize: 20))
              )
            ],),
        ),
      )
    );
  }

}