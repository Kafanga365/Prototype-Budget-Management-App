import 'package:hive/hive.dart';
import '../models/expense.dart';

class HiveService {
  final Box<Expense> _box = Hive.box<Expense>('expenses');

  // Add a new expense
  Future<void> addExpense(Expense expense) async {
    await _box.add(expense);
  }

  // Get all expenses
  List<Expense> getAllExpenses() {
    return _box.values.toList();
  }

  // Delete an expense
  Future<void> deleteExpense(int index) async {
    await _box.deleteAt(index);
  }

  // Update an expense
  Future<void> updateExpense(int index, Expense newExpense) async {
    await _box.putAt(index, newExpense);
  }
}
