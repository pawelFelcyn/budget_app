import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/data/dtos/expense_category.dart';
import 'package:budget_app/data/responses/firebase_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseServiceImpl extends ExpenseService{

  final CollectionReference expensesRef =
      FirebaseFirestore.instance.collection('expenses');

  @override
  Future<FirebaseResponse> createExpense(CreateExpenseDto expenseDto) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated.');
      }

      await expensesRef.add({
        'userId': user.uid,
        'title': expenseDto.title,
        'cost': expenseDto.cost,
        'description': expenseDto.description,
        'createdAt': DateTime.now(),
        'category': expenseDto.category.toString().split('.').last
      });
      return FirebaseResponse.succes();
    } on Exception catch (e) {
      return FirebaseResponse.withError(e);
    }
  }

  @override
  Future<FirebaseGetResopnse<List<ExpenseDto>>> getAllExpenses(DateTime from, DateTime to, ExpenseCategory? filterCategory) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return FirebaseGetResopnse.withErrorMessage('You are not authenticated');
      }

      var query = expensesRef
          .where('userId', isEqualTo: user.uid)
          .where('createdAt', isGreaterThanOrEqualTo: from)
          .where('createdAt', isLessThanOrEqualTo: to);
      if (filterCategory != null){
        query = query.where('category', isEqualTo: filterCategory.toString().split('.').last);
      }
      
      final snapshot = await query.get();

      var result = snapshot.docs.map((doc) {
        final expenseData = doc.data() as Map<String, dynamic>;
        return ExpenseDto(
          id: doc.id,
          title: expenseData['title'],
          cost: expenseData['cost'],
          description: expenseData['description'],
          craetedAt: expenseData['createdAt'].toDate(),
          category: _parseCategory(expenseData['category'])
        );
      }).toList();
      result.sort((a,b) => a.craetedAt.compareTo(b.craetedAt));
      return FirebaseGetResopnse.succes(result);
    } on Exception catch (e) {
      return FirebaseGetResopnse.withError<List<ExpenseDto>>(e);
    }
  }

  ExpenseCategory _parseCategory(String value){
    return ExpenseCategory.values.firstWhere((element) => element.toString().split('.').last == value);
  }

  @override
  FirebaseResponse deleteById(String id){
    try{
      final DocumentReference documentRef = expensesRef.doc(id);
      documentRef.delete();
      return FirebaseResponse.succes();
    } on Exception catch(e){
      return FirebaseResponse.withError(e);
    }
  }
}

 abstract class ExpenseService{
  Future<FirebaseResponse> createExpense(CreateExpenseDto createExpenseDto);
  Future<FirebaseGetResopnse<List<ExpenseDto>>> getAllExpenses(DateTime from, DateTime to, ExpenseCategory? filterCategory);
  FirebaseResponse deleteById(String id);
}