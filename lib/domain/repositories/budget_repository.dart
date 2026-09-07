import '../models/budget.dart';

/// Repository interface for budget operations
abstract class BudgetRepository {
  /// Watch all budgets for a specific month and year
  Stream<List<Budget>> watchBudgetsForMonth(int month, int year);

  /// Get a specific budget
  Future<Budget?> getBudget(int categoryId, int month, int year);

  /// Set (insert or update) a budget
  Future<void> setBudget({
    required int categoryId,
    required double amount,
    required int month,
    required int year,
  });

  /// Delete a budget
  Future<void> deleteBudget(int budgetId);

  /// Get spent amount for a category in a specific month
  Future<double> getSpentForCategory(int categoryId, int month, int year);

  /// Get budget with spending information
  Future<BudgetWithSpending?> getBudgetWithSpending(
      int categoryId,
      int month,
      int year,
      );

  /// Get all budgets with spending for a month
  Future<List<BudgetWithSpending>> getBudgetsWithSpending(int month, int year);

  /// Watch all budgets (all months)
  Stream<List<Budget>> watchAllBudgets();

  /// Insert a list of budgets (for backup restore)
  Future<void> insertBudgets(List<Budget> budgets);

  /// Clear all budgets (for backup restore)
  Future<void> clearAllBudgets();

}