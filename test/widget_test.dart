import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:budget_app/screens/expense_list_screen.dart';
import 'package:budget_app/models/expense.dart';

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return '.';
  }
}

late Box<Expense> expenseBox;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();

    final testDir = Directory('./test_hive_dir');
    if (!testDir.existsSync()) testDir.createSync();
    Hive.init(testDir.path);
    Hive.registerAdapter(ExpenseAdapter());

    if (!Hive.isBoxOpen('expenses')) {
      expenseBox = await Hive.openBox<Expense>('expenses');
    } else {
      expenseBox = Hive.box<Expense>('expenses');
    }
  });

  tearDownAll(() async {
    if (Hive.isBoxOpen('expenses')) {
      final box = Hive.box<Expense>('expenses');
      if (box.isOpen) {
        await box.close();
      }
    }
  });

  testWidgets('Expense List Screen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExpenseListScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Your Expenses'), findsOneWidget);
  });
}
