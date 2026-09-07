import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../domain/models/budget.dart';
import '../domain/models/category.dart';
import '../domain/models/recurring_transaction.dart';
import '../domain/models/transaction.dart';
import '../domain/repositories/budget_repository.dart';
import '../domain/repositories/category_repository.dart';
import '../domain/repositories/recurring_transaction_repository.dart';
import '../domain/repositories/transaction_repository.dart';

class BackupService {
  final TransactionRepository _transactionRepo;
  final CategoryRepository _categoryRepo;
  final BudgetRepository _budgetRepo;
  final RecurringTransactionRepository _recurringRepo;

  BackupService(
      this._transactionRepo,
      this._categoryRepo,
      this._budgetRepo,
      this._recurringRepo,
      );

  /// Create full JSON backup
  Future<File> createBackup() async {
    final transactions = await _transactionRepo.watchAllTransactions().first;
    final categories = await _categoryRepo.watchAllCategories().first;
    final budgets = await _budgetRepo.watchAllBudgets().first;
    final recurring = await _recurringRepo.watchAllRecurringTransactions().first;

    final backupData = {
      'version': '1.0.0',
      'created_at': DateTime.now().toIso8601String(),
      'transactions': transactions.map((t) => t.toJson()).toList(),
      // FIX: Use the generated toJson method for categories, which correctly handles enums.
      'categories': categories.map((c) => c.toJson()).toList(),
      'budgets': budgets.map((b) => b.toJson()).toList(),
      'recurring': recurring.map((r) => r.toJson()).toList(),
    };

    final jsonString = const JsonEncoder.withIndent('  ').convert(backupData);

    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${directory.path}/trackmymoney_backup_$timestamp.json');

    await file.writeAsString(jsonString);
    return file;
  }

  /// Share backup file
  Future<void> shareBackup(File file) async {
    await Share.shareXFiles([XFile(file.path)], text: 'Track My Money Backup');
  }


  /// Restore from backup file
  Future<void> restoreBackup(File file) async {
    final jsonString = await file.readAsString();
    final backupData = jsonDecode(jsonString) as Map<String, dynamic>;

    // --- Restore logic implementation ---

    // 1. Clear existing data.
    // IMPORTANT: You should ask for user confirmation in the UI before calling this method.
    await _transactionRepo.clearAllTransactions();
    await _categoryRepo.clearAllCategories();
    await _budgetRepo.clearAllBudgets();
    await _recurringRepo.clearAllRecurringTransactions();

    // 2. Insert categories first to maintain relational integrity.
    final categoriesData = backupData['categories'] as List;
    final categories = categoriesData
        .map((data) => Category.fromJson(data as Map<String, dynamic>))
        .toList();
    await _categoryRepo.insertCategories(categories);

    // 3. Insert transactions.
    final transactionsData = backupData['transactions'] as List;
    final transactions = transactionsData
        .map((data) => Transaction.fromJson(data as Map<String, dynamic>))
        .toList();
    await _transactionRepo.insertTransactions(transactions);

    // 4. Insert budgets.
    final budgetsData = backupData['budgets'] as List;
    final budgets = budgetsData
        .map((data) => Budget.fromJson(data as Map<String, dynamic>))
        .toList();
    await _budgetRepo.insertBudgets(budgets);

    // 5. Insert recurring transactions.
    final recurringData = backupData['recurring'] as List;
    final recurring = recurringData
        .map((data) => RecurringTransaction.fromJson(data as Map<String, dynamic>))
        .toList();
    await _recurringRepo.insertRecurringTransactions(recurring);
  }
}
