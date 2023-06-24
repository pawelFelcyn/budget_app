import 'package:budget_app/data/dtos/create_incom_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/dtos/incom_category.dart';
import '../../data/dtos/incom_dto.dart';
import '../../data/responses/firebase_response.dart';

abstract class IncomService{
  Future<FirebaseResponse> createIncom(CreateIncomDto dto);
  Future<List<IncomDto>> getAllIncoms(DateTime from, DateTime to, IncomCategory? filterCategory);
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

   @override
  Future<List<IncomDto>> getAllIncoms(DateTime from, DateTime to, IncomCategory? filterCategory) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated.');
      }

      var query = incomsRef
          .where('userId', isEqualTo: user.uid)
          .where('createdAt', isGreaterThanOrEqualTo: from)
          .where('createdAt', isLessThanOrEqualTo: to);
      if (filterCategory != null){
        query = query.where('category', isEqualTo: filterCategory.toString().split('.').last);
      }
      
      final snapshot = await query.get();

      var result = snapshot.docs.map((doc) {
        final expenseData = doc.data() as Map<String, dynamic>;
        return IncomDto(
          title: expenseData['title'],
          amount: expenseData['amount'],
          description: expenseData['description'],
          craetedAt: expenseData['createdAt'].toDate(),
          category: _parseCategory(expenseData['category'])
        );
      }).toList();
      result.sort((a,b) => a.craetedAt.compareTo(b.craetedAt));
      return result;
    } catch (e) {
      throw Exception('Failed to get expenses: $e');
    }
  }

  IncomCategory _parseCategory(String value){
    return IncomCategory.values.firstWhere((element) => element.toString().split('.').last == value);
  }
}