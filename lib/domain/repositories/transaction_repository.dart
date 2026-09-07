import '../models/transaction.dart';

/// Repository interface (contract) for transaction operations
/// This is like a @Dao interface in Room
abstract class TransactionRepository {
  /// Watch all transactions (reactive stream)
  Stream<List<Transaction>> watchAllTransactions();

  /// Get a single transaction
  Future<Transaction?> getTransactionById(int id);

  /// Add a new transaction
  Future<int> addTransaction({
    required double amount,
    required TransactionType type,
    required String category,
    required DateTime date,
    String? note,
  });

  /// Update an existing transaction
  Future<bool> updateTransaction(Transaction transaction);

  /// Delete a transaction
  Future<void> deleteTransaction(int id);

  /// Watch transactions by type
  Stream<List<Transaction>> watchTransactionsByType(TransactionType type);

  /// Watch transactions in date range
  Stream<List<Transaction>> watchTransactionsByDateRange(
      DateTime startDate,
      DateTime endDate,
      );

  /// Get transactions count by date range
  Future<int> getTransactionCount(DateTime startDate, DateTime endDate);

  /// Get total income in date range
  Future<double> getTotalIncome(DateTime startDate, DateTime endDate);

  /// Get total expense in date range
  Future<double> getTotalExpense(DateTime startDate, DateTime endDate);

  /// Get expense breakdown by category
  Future<Map<String, double>> getExpenseByCategory(
      DateTime startDate,
      DateTime endDate,
      );

  /// Get income breakdown by category
  Future<Map<String, double>> getIncomeByCategory(
      DateTime startDate,
      DateTime endDate,
      );

  /// Insert a list of transactions (for backup restore)
  Future<void> insertTransactions(List<Transaction> transactions);

  /// Clear all transactions (for backup restore)
  Future<void> clearAllTransactions();
}