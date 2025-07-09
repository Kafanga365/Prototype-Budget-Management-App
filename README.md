# budget_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# BudgetApp

BudgetApp is a Flutter-based mobile and web application that helps users manage and track their daily expenses efficiently.

## Features

- Add, view, and delete expenses
- Categorize expenses and include descriptions
- Data persistence using Hive (local NoSQL storage)
- Responsive layout for web and mobile
- Platform-tested: Chrome, iPhone 12 Pro, and iPad Pro simulator

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- (For iOS) Xcode with a connected device or simulator

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Kafanga365/Prototype-Budget-Management-App.git
   cd Prototype-Budget-Management-App
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. (Optional for iOS) Precache iOS artifacts:
   ```bash
   flutter precache --ios
   ```

### Running the App

- On Chrome:
  ```bash
  flutter run -d chrome
  ```

- On iOS Simulator or Device:
  ```bash
  flutter run -d <your_ios_device_id>
  ```

## Running Tests

- To run all unit and widget tests:
  ```bash
  flutter test
  ```

## Contributing

Contributions are welcome. Please fork the repo and submit a pull request.

## License

This project is licensed under the MIT License.