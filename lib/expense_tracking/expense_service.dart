import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseService extends StateNotifier<List<dynamic>> {
  ExpenseService() : super([]);
}

final expenseProvider = StateNotifierProvider<ExpenseService, List<dynamic>>((ref) {
  return ExpenseService();
});