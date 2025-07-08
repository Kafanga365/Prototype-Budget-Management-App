import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:budget_app/models/expense.dart';
import 'package:budget_app/screens/expense_list_screen.dart';

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    // Provide a temporary directory to avoid conflicts during tests
    return '.';
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();

    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseAdapter());

    // Close the box if it's already open to avoid conflicts
    if (Hive.isBoxOpen('expenses')) {
      await Hive.box('expenses').close();
    }
    await Hive.openBox<Expense>('expenses');
  });

  tearDownAll(() async {
    if (Hive.isBoxOpen('expenses')) {
      await Hive.box('expenses').close();
    }
  });

  testWidgets('Expense List Screen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ExpenseListScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Your Expenses'), findsOneWidget);
  });
}
