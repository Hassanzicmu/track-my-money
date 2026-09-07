# Track My Money 💰

**Track My Money** is a completely offline-first personal finance management application built with Flutter.  
It helps users track income, expenses, budgets, recurring subscriptions (bills, salary, memberships), and overall financial health with a clean, modern, and intuitive user interface.

## Key Features

### Interactive Dashboard
- Comprehensive visual overview of your current financial situation
- **Expense breakdown charts** using beautiful and interactive visualizations (powered by fl_chart)
- Quick summary cards showing:
    - Current total balance
    - Total income (current period)
    - Total expenses (current period)
    - Net savings / deficit
- Recent transactions list with quick access to latest activity
- Visual indicators for budget status across categories

### Transaction Management
- Record both **Income** and **Expense** transactions
- Support for detailed transaction information:
    - Amount
    - Date & time
    - Category
    - Custom notes/description
    - Optional tags/flags
- Powerful filtering options:
    - By date range (Today, Yesterday, This Week, This Month, This Year, Custom range)
    - By category
    - By transaction type (Income/Expense)
- Quick edit/delete functionality for existing transactions

### Category Management
- Fully customizable categories for better organization
- Separate category types: **Income categories** and **Expense categories**
- Rich customization options for each category:
    - Custom name
    - Unique icon (Material Icons)
    - Distinct color
- Default categories provided on first launch
- Easy category management (add, edit, delete, reorder)

### Budgeting System
- Set monthly budgets per category or overall monthly budget
- Visual progress bars showing spending against budget limits
- Clear visual indicators when approaching or exceeding budget
- Color-coded status (safe / warning / exceeded)
- Budget rollover option (carry over unused budget to next month - configurable)
- Monthly budget reset with historical tracking

### Recurring Transactions & Subscriptions
- Manage regular income and expenses automatically
- Supported frequencies:
    - Daily
    - Weekly
    - Bi-weekly
    - Monthly
    - Quarterly
    - Yearly
- Flexible start/end dates
- Automatic generation of future transactions (visible in calendar preview)
- One-tap mark as paid/skipped for current occurrence
- Edit recurring pattern without affecting past entries

### Appearance & Settings
- Full support for **Light** and **Dark** themes
- Automatic theme detection based on system settings
- Manual theme override option
- Multiple currency support with proper formatting
- Data management:
    - Export data (JSON/CSV)
    - Import data
    - Clear all data (with confirmation)
- Backup reminder system

## Tech Stack & Architecture

The project follows **Clean Architecture** principles with clear separation of concerns for better scalability, testability, and maintainability.

### Core Technologies
- **Language:** Dart
- **Framework:** Flutter (latest stable)

### Main Packages & Libraries
| Purpose                        | Package                          | Description                                                                 |
|-------------------------------|----------------------------------|-----------------------------------------------------------------------------|
| State Management              | flutter_riverpod                 | Modern, compile-safe, testable provider-based state management              |
| Local Database (Offline-first)| drift + sqlite3                  | Reactive SQLite persistence layer with type-safe queries                    |
| Routing & Navigation          | go_router                        | Declarative, type-safe navigation with deep linking support                 |
| Immutable Data Models         | freezed                          | Code generation for immutable classes, unions, copyWith, equality & more   |
| JSON Serialization            | json_serializable                | Automatic JSON serialization/deserialization                               |
| Charts & Visualizations       | fl_chart                         | Beautiful, customizable charts (pie, bar, line) for expense breakdowns     |
| Internationalization/Formatting| intl                            | Proper currency, date, and number formatting                                |
| Code Generation               | build_runner                     | Required for freezed, drift, and json_serializable code generation         |

## Project Structure

```text
lib/
├── main.dart
│
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_theme.dart
│   └── utils/
│       ├── constants.dart
│       ├── date_utils.dart
│       └── json_converters.dart
│
├── data/
│   ├── local/
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   ├── app_database.g.dart
│   │   │   └── tables/
│   │   │       ├── budgets_table.dart
│   │   │       ├── categories_table.dart
│   │   │       ├── recurring_transactions_table.dart
│   │   │       └── transactions_table.dart
│   │   └── entities/
│   │       ├── budget_entity.dart
│   │       ├── category_entity.dart
│   │       ├── recurring_transaction_entity.dart
│   │       └── transaction_entity.dart
│   └── repositories/
│       ├── budget_repository_impl.dart
│       ├── category_repository_impl.dart
│       ├── recurring_transaction_repository_impl.dart
│       └── transaction_repository_impl.dart
│
├── domain/
│   ├── models/
│   │   ├── budget.dart
│   │   ├── budget.freezed.dart
│   │   ├── category.dart
│   │   ├── category.freezed.dart
│   │   ├── dashboard_stats.dart
│   │   ├── recurring_transaction.dart
│   │   ├── recurring_transaction.freezed.dart
│   │   ├── transaction.dart
│   │   └── transaction.freezed.dart
│   ├── repositories/
│   │   ├── budget_repository.dart
│   │   ├── category_repository.dart
│   │   ├── recurring_transaction_repository.dart
│   │   └── transaction_repository.dart
│   └── services/
│       └── recurring_transaction_service.dart
│
└── presentation/
    ├── providers/
    │   ├── budget_provider.dart
    │   ├── category_provider.dart
    │   ├── dashboard_provider.dart
    │   ├── database_provider.dart
    │   ├── recurring_transaction_provider.dart
    │   ├── theme_provider.dart
    │   └── transaction_provider.dart
    └── screens/
        ├── main_screen.dart
        ├── add_transaction/
        │   └── add_transaction_screen.dart
        ├── budget/
        │   ├── budget_screen.dart
        │   ├── set_budget_dialog.dart
        │   └── widgets/
        │       ├── budget_card.dart
        │       └── budget_progress_bar.dart
        ├── categories/
        │   ├── add_category_screen.dart
        │   └── categories_screen.dart
        ├── dashboard/
        │   ├── budget_summary_widget.dart
        │   ├── dashboard_screen.dart
        │   ├── expense_chart.dart
        │   ├── recent_transactions_widget.dart
        │   ├── recurring_summary_widget.dart
        │   └── summary_card.dart
        ├── home/
        │   ├── home_screen.dart
        │   └── transaction_card.dart
        ├── recurring/
        │   ├── add_recurring_dialog.dart
        │   ├── recurring_transactions_screen.dart
        │   └── widgets/
        │       └── recurring_card.dart
        └── settings/
            └── settings_screen.dart
```

Getting Started
Prerequisites

Flutter SDK (latest stable version recommended)
Dart SDK (comes with Flutter)
IDE with Flutter support (VS Code / Android Studio / IntelliJ)

Installation Steps

Clone the repository
git clone https://github.com/your-username/track_my_money.git
cd track_my_money

Install dependencies
flutter pub get

Generate required code
(very important — Drift + Freezed + JsonSerializable need this step)
dart run build_runner build --delete-conflicting-outputs

or (watch mode - recommended during development):
dart run build_runner watch --delete-conflicting-outputs

Run the application

# Debug mode
flutter run

# Release mode (better performance)
flutter run --release

Important Notes

The application is 100% offline — no internet connection is required
All data is stored locally using SQLite via Drift
First launch will create default categories and show welcome onboarding
Currency is currently fixed to system locale (can be extended for manual selection)