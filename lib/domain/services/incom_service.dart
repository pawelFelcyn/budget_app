import 'package:budget_app/data/dtos/create_incom_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/dtos/incom_dto.dart';
import '../../data/responses/firebase_response.dart';

abstract class IncomService{
  Future<FirebaseResponse> createIncom(CreateIncomDto dto);
} 

class IncomServiceImpl extends IncomService{
  final CollectionReference incomsRef =
      FirebaseFirestore.instance.collection('incoms');
  
  @override
  Future<FirebaseResponse> createIncom(CreateIncomDto dto) async{
     var expenseDto = IncomDto.createdNow(dto.title, dto.amount, 
    description: dto.description, category: dto.category);
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated.');
      }

      await incomsRef.add({
        'userId': user.uid,
        'title': expenseDto.title,
        'amount': expenseDto.amount,
        'description': expenseDto.description,
        'createdAt': expenseDto.craetedAt,
        'category': expenseDto.category.toString().split('.').last
      });
      return FirebaseResponse.succes();
    } on Exception catch (e) {
      return FirebaseResponse.withError(e);
    }
  }
}