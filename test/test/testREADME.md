Automated Test Suite for Budget App


Test Overview

| Test File                      | Description                                                            | Status |
|-------------------------------|-------------------------------------------------|--------|--------------|--------|
| expense_model_test.dart       | Unit test to verify the creation and properties of the Expense model.   |Passed |
| expense_list_screen_test.dart | Widget test that ensures the UI displays the expense list correctly, including the title and individual entries. | Passed (after Hive issues) |
| widget_test.dart              | General widget test scaffold. | May need updates | Failed

---

How to locally run Tests?

```bash
flutter test
