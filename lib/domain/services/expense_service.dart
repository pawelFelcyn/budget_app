import 'package:budget_app/data/dtos/create_expense_dto.dart';
import 'package:budget_app/data/dtos/expense.dto.dart';
import 'package:budget_app/data/responses/firebase_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseService{

  final CollectionReference expensesRef =
      FirebaseFirestore.instance.collection('expenses');

  Future<FirebaseResponse> createExpense(CreateExpenseDto createExpenseDto) async {
    var expenseDto = ExpenseDto.createdNow(createExpenseDto.title, createExpenseDto.cost, description: createExpenseDto.description);
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
        'createdAt': expenseDto.craetedAt,
      });
      return FirebaseResponse.succes();
    } on Exception catch (e) {
      return FirebaseResponse.withError(e);
    }
  }

  Future<List<ExpenseDto>> getAllExpenses() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated.');
      }

      final QuerySnapshot snapshot = await expensesRef
          .where('userId', isEqualTo: user.uid)
          // .orderBy('createdAt', descending: true)
          .get();

      var result = snapshot.docs.map((doc) {
        final expenseData = doc.data() as Map<String, dynamic>;
        return ExpenseDto(
          title: expenseData['title'],
          cost: expenseData['cost'],
          description: expenseData['description'],
          craetedAt: expenseData['createdAt'].toDate(),
        );
      }).toList();
      result.sort((a,b) => a.craetedAt.compareTo(b.craetedAt));
      return result;
    } catch (e) {
      throw Exception('Failed to get expenses: $e');
    }
  }
}