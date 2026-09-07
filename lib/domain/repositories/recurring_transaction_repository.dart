import '../models/recurring_transaction.dart';

/// Repository interface for recurring transaction operations
abstract class RecurringTransactionRepository {
  /// Watch all recurring transactions
  Stream<List<RecurringTransaction>> watchAllRecurringTransactions();

  /// Watch active recurring transactions only
  Stream<List<RecurringTransaction>> watchActiveRecurringTransactions();

  /// Get recurring transactions that are due
  Future<List<RecurringTransaction>> getDueRecurringTransactions();

  /// Get a single recurring transaction by ID
  Future<RecurringTransaction?> getRecurringTransactionById(int id);

  /// Create a new recurring transaction
  Future<int> createRecurringTransaction({
    required double amount,
    required String type,
    required int categoryId,
    required RecurrenceFrequency frequency,
    required DateTime startDate,
    DateTime? endDate,
    String? note,
  });

  /// Update a recurring transaction
  Future<bool> updateRecurringTransaction(RecurringTransaction recurring);

  /// Delete a recurring transaction
  Future<void> deleteRecurringTransaction(int id);

  /// Pause a recurring transaction
  Future<void> pauseRecurringTransaction(int id);

  /// Resume a recurring transaction
  Future<void> resumeRecurringTransaction(int id);

  /// Update last generated date and next due date
  Future<void> updateGenerationDates(
      int id,
      DateTime lastGenerated,
      DateTime nextDueDate,
      );

  /// Check if transaction exists for recurring and date
  Future<bool> transactionExistsForDate(int recurringId, DateTime date);

  /// Insert a list of recurring transactions (for backup restore)
  Future<void> insertRecurringTransactions(List<RecurringTransaction> recurring);

  /// Clear all recurring transactions (for backup restore)
  Future<void> clearAllRecurringTransactions();

}