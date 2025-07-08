import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/hive_service.dart';

class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  final HiveService _hiveService = HiveService();
  late List<Expense> _expenses;

  @override
  void initState() {
    super.initState();
    _expenses = _hiveService.getAllExpenses();
  }

  void _refresh() {
    setState(() {
      _expenses = _hiveService.getAllExpenses();
    });
  }

  void _deleteExpense(int index) async {
    await _hiveService.deleteExpense(index);
    _refresh();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Expense deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Expenses'),
      ),
      body: _expenses.isEmpty
          ? const Center(child: Text('No expenses added yet.'))
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    title: Text(
                        '${expense.category} - £${expense.amount.toStringAsFixed(2)}'),
                    subtitle: Text(
                      '${expense.description ?? 'No description'}\nDate: ${expense.date.day}/${expense.date.month}/${expense.date.year}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteExpense(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          _refresh();
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Expense',
      ),
    );
  }
}
