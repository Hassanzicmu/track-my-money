import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/recurring_transaction.dart';
import '../../domain/repositories/recurring_transaction_repository.dart';
import '../../domain/services/recurring_transaction_service.dart';
import 'database_provider.dart';

/// Provider that watches all recurring transactions
final recurringTransactionsProvider =
StreamProvider<List<RecurringTransaction>>((ref) {
  final repository = ref.watch(recurringTransactionRepositoryProvider);
  return repository.watchAllRecurringTransactions();
});

/// Provider that watches active recurring transactions only
final activeRecurringTransactionsProvider =
StreamProvider<List<RecurringTransaction>>((ref) {
  final repository = ref.watch(recurringTransactionRepositoryProvider);
  return repository.watchActiveRecurringTransactions();
});

/// Provider for recurring transaction actions
final recurringTransactionActionsProvider =
Provider<RecurringTransactionActions>((ref) {
  final repository = ref.watch(recurringTransactionRepositoryProvider);
  final service = ref.watch(recurringTransactionServiceProvider);
  return RecurringTransactionActions(repository, service);
});

/// Class containing all recurring transaction actions
class RecurringTransactionActions {
  final RecurringTransactionRepository _repository;
  final RecurringTransactionService _service;

  RecurringTransactionActions(this._repository, this._service);

  /// Create a new recurring transaction
  Future<int> createRecurringTransaction({
    required double amount,
    required String type,
    required int categoryId,
    required RecurrenceFrequency frequency,
    required DateTime startDate,
    DateTime? endDate,
    String? note,
  }) async {
    return await _repository.createRecurringTransaction(
      amount: amount,
      type: type,
      categoryId: categoryId,
      frequency: frequency,
      startDate: startDate,
      endDate: endDate,
      note: note,
    );
  }

  /// Update a recurring transaction
  Future<void> updateRecurringTransaction(
      RecurringTransaction recurring,
      ) async {
    await _repository.updateRecurringTransaction(recurring);
  }

  /// Delete a recurring transaction
  Future<void> deleteRecurringTransaction(int id) async {
    await _repository.deleteRecurringTransaction(id);
  }

  /// Pause a recurring transaction
  Future<void> pauseRecurringTransaction(int id) async {
    await _repository.pauseRecurringTransaction(id);
  }

  /// Resume a recurring transaction
  Future<void> resumeRecurringTransaction(int id) async {
    await _repository.resumeRecurringTransaction(id);
  }

  /// Get a single recurring transaction
  Future<RecurringTransaction?> getRecurringTransactionById(int id) async {
    return await _repository.getRecurringTransactionById(id);
  }

  /// Generate all due transactions
  Future<int> generateDueTransactions() async {
    return await _service.generateDueTransactions();
  }

  /// Get next due description
  String getNextDueDescription(RecurringTransaction recurrence) {
    return _service.getNextDueDescription(recurrence);
  }

  /// Validate recurrence
  String? validateRecurrence({
    required double amount,
    required DateTime startDate,
    DateTime? endDate,
  }) {
    return _service.validateRecurrence(
      amount: amount,
      startDate: startDate,
      endDate: endDate,
    );
  }
}