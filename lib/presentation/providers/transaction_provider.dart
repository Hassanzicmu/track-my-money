import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/notification_preferences.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import 'database_provider.dart';
import 'notification_provider.dart'; // NEW

/// Provider that watches all transactions (reactive)
final transactionsProvider = StreamProvider<List<Transaction>>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAllTransactions();
});

/// Provider for transaction operations (actions)
final transactionActionsProvider = Provider<TransactionActions>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  final notificationPrefs = ref.watch(
      notificationPreferencesProvider); // NEW
  return TransactionActions(repository, notificationPrefs); // NEW
});

/// Class containing all transaction actions
class TransactionActions {
  final TransactionRepository _repository;
  final NotificationPreferences _notificationPrefs; // NEW

  TransactionActions(this._repository,
      this._notificationPrefs); // UPDATED

  /// Add a new transaction
  Future<void> addTransaction({
    required double amount,
    required TransactionType type,
    required String category,
    required DateTime date,
    String? note,
  }) async {
    await _repository.addTransaction(
      amount: amount,
      type: type,
      category: category,
      date: date,
      note: note,
    );

    // NEW: Check budget alert if it's an expense
    if (type == TransactionType.expense && _notificationPrefs.enableBudgetAlerts) {
      await _checkBudgetAlert(category, date);
    }
  }

  /// Update an existing transaction
  Future<void> updateTransaction(Transaction transaction) async {
    await _repository.updateTransaction(transaction);
  }

  /// Delete a transaction
  Future<void> deleteTransaction(int id) async {
    await _repository.deleteTransaction(id);
  }

  /// Get a single transaction by ID
  Future<Transaction?> getTransactionById(int id) async {
    return await _repository.getTransactionById(id);
  }

  /// NEW: Check and trigger budget alert if threshold reached
  Future<void> _checkBudgetAlert(String categoryName,
      DateTime date) async {
    // This is a simplified version - you'll need to inject budget repository
    // For now, this shows the structure
    // In production, inject BudgetRepository and check actual budget

    // TODO: Implement proper budget checking with repository
    // Example logic:
    // 1. Get budget for category and current month
    // 2. Get total spent for category this month
    // 3. Calculate percentage
    // 4. If >= 80%, show notification
  }
}