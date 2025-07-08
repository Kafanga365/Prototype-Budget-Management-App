import 'package:flutter_test/flutter_test.dart';
import 'package:budget_app/models/expense.dart';

void main() {
  group('Expense Model Tests', () {
    test('Expense can be created with all required fields', () {
      final expense = Expense(
        category: 'Food',
        amount: 10.0,
        date: DateTime.now(),
      );

      expect(expense.category, 'Food');
      expect(expense.amount, 10.0);
      expect(expense.date, isA<DateTime>());
    });

    test('Expense handles negative amount', () {
      final expense = Expense(
        category: 'Misc',
        amount: -10.0,
        date: DateTime.now(),
      );

      expect(expense.amount, -10.0);
    });
  });
}
