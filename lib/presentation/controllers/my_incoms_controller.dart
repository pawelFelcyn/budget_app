import 'package:budget_app/data/dtos/incom_category.dart';
import 'package:budget_app/data/dtos/incom_dto.dart';
import 'package:budget_app/domain/mappers/incom_category_mapper.dart';
import 'package:budget_app/domain/services/incom_service.dart';
import 'package:budget_app/presentation/controllers/controller_base.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:get/get.dart';

class MyIncomsController extends ControllerBase{
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();
  IncomCategory? filterCategory;
  final RxList<IncomDto> incoms = <IncomDto>[].obs;
  final IncomCategoryMapper _mapper;
  final IncomService _service;
  Rx<bool> firebaseFailed = false.obs;
 
  MyIncomsController(this._service, this._mapper);

  void goToCreateNewView(){
    Get.toNamed('/myincoms/create');
  }

  void loadIncoms() async{
     incoms.clear();
    var incomsResult = await _service.getAllIncoms(dateFrom, dateTo, filterCategory);

    if (!incomsResult.isSucces){
      firebaseFailed.value = true;
      return;
    }

    firebaseFailed.value = false;
    for (final incom in incomsResult.getContentUnsafe()){
      incoms.add(incom);
    }
  }

  IconData? getCategoryIcon(IncomCategory category) {
    return _mapper.toIcon(category);
  }

  void goToDetailsPage(incom) {
    Get.toNamed('/myincoms/details', arguments: incom);
  }
}