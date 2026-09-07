/// App-wide string constants
class AppStrings {
  AppStrings._();

  // App
  static const String appName = 'Track My Money';

  // Transaction types
  static const String income = 'Income';
  static const String expense = 'Expense';

  // Common actions
  static const String add = 'Add';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String confirm = 'Confirm';

  // Home screen
  static const String transactions = 'Transactions';
  static const String noTransactions = 'No transactions yet';
  static const String addFirstTransaction = 'Tap + to add your first transaction';

  // Add/Edit Transaction
  static const String addTransaction = 'Add Transaction';
  static const String editTransaction = 'Edit Transaction';
  static const String amount = 'Amount';
  static const String category = 'Category';
  static const String date = 'Date';
  static const String note = 'Note';
  static const String selectType = 'Select Type';
  static const String selectCategory = 'Select Category';
  static const String optional = 'Optional';

  // Validation
  static const String amountRequired = 'Please enter an amount';
  static const String amountInvalid = 'Please enter a valid amount';
  static const String categoryRequired = 'Please select a category';

  // Delete confirmation
  static const String deleteTransactionTitle = 'Delete Transaction';
  static const String deleteTransactionMessage =
      'Are you sure you want to delete this transaction?';

  // Categories (we'll make these dynamic later)
  static const List<String> incomeCategories = [
    'Salary',
    'Freelance',
    'Business',
    'Investment',
    'Gift',
    'Other Income',
  ];

  static const List<String> expenseCategories = [
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Entertainment',
    'Bills & Utilities',
    'Healthcare',
    'Education',
    'Rent',
    'Other Expense',
  ];
}