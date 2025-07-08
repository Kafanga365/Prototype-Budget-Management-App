import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../models/expense.dart';
import '../services/hive_service.dart';

class SummaryScreen extends StatelessWidget {
  final HiveService _hiveService = HiveService();

  SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Expense> expenses = _hiveService.getAllExpenses();

    double total = expenses.fold(0, (sum, e) => sum + e.amount);

    Map<String, double> byCategory = {};
    for (var e in expenses) {
      byCategory[e.category] = (byCategory[e.category] ?? 0) + e.amount;
    }

    final Expense? largest = expenses.isNotEmpty
        ? expenses.reduce((a, b) => a.amount > b.amount ? a : b)
        : null;

    return Scaffold(
      appBar: AppBar(title: Text('Expense Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: expenses.isEmpty
            ? Center(child: Text('No expenses to analyze.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Spent: £${total.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 24),
                  Text('Spending by Category:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ...byCategory.entries.map((e) => ListTile(
                        title: Text(e.key),
                        trailing: Text('£${e.value.toStringAsFixed(2)}'),
                      )),
                  SizedBox(height: 24),
                  if (largest != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Largest Expense:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        ListTile(
                          title: Text('${largest.category}'),
                          subtitle: Text(
                              '${largest.description ?? "No description"}'),
                          trailing:
                              Text('£${largest.amount.toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                ],
              ),
      ),
    );
  }
}
