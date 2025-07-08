System-Level Test Plan – Budget Management App

This test plan outlines the core system-level test cases that ensure the functionality, usability, and reliability of the budget management app across platforms.

| Test ID     | Test Description                                 | Type             | Input                                                  |Expected Output                                          | Status  |
|-------------|--------------------------------------------------|------------------|--------------------------------------------------------|---------------------------------------------------------|---------|
| TC001       | Add new expense with valid inputs                | Unit             | Amount = £25, Category = “Food”, Note = “Lunch”        | Expense saved and total budget updated                  | Pass    |
| TC002       | Add expense with missing amount                  | Edge Case        | Category = “Transport”, Note = “Bus fare”              | Error: “Please enter an amount”                         | Pass    |
| TC003       | Set daily spending limit                         | Unit             | Limit = £30                                            | Limit saved, dashboard updated                          | Pass    |
| TC004       | Exceed spending limit                            | Integration      | Add £50 after limit set to £30                         | App displays warning: “Limit exceeded”                  | Pass    |
| TC005       | View monthly summary with data                   | UI               | Tap “View Summary” on July                             | Bar graph with totals and categories shown              | Pass    |
| TC006       | View monthly summary with no data                | Edge Case        | Tap “View Summary” on empty month                      | Message: “No data available”                            | Pass    |
| TC007       | Bank API integration with valid credentials      | Integration      | Login to bank and sync                                 | Transactions imported                                   | Pass    |
| TC008       | Bank API integration with invalid credentials    | Edge Case        | Incorrect login                                        | Error: “Login failed. Try again.”                       | Pass    |
| TC009       | UI testing across Android and iOS                | UI               | Open app on both OS                                    | UI renders correctly, buttons functional                | Pass    |
| TC010       | Set savings goal higher than income              | Validation       | Goal = £1,000; income = £600                           | Warning: “Goal exceeds available income”                | Pass    |

> All test cases have passed based on internal simulation and functional validation.
