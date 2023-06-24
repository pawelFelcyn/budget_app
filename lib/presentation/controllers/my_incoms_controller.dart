import 'package:budget_app/data/dtos/incom_category.dart';
import 'package:budget_app/data/dtos/incom_dto.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:get/get.dart';

class MyIncomsController extends ControllerBase{
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();
  IncomCategory? filterCategory;
  final RxList<IncomDto> incoms = <IncomDto>[].obs;
  final IncomCategoryMapper _mapper;

  MyIncomsController(this._mapper);

  void goToCreateNewView(){
    Get.toNamed('/myincoms/create');
  }

  void loadIncoms(){

  }

  IconData? getCategoryIcon(IncomCategory category) {
    return _mapper.toIcon(category);
  }

  void goToDetailsPage(expens) {}
}