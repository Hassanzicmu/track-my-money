import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/budget.dart';
import '../../domain/repositories/budget_repository.dart';
import 'database_provider.dart';

/// Current month and year for budget view
final currentBudgetMonthProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

/// Provider that watches budgets for current month
final budgetsProvider = StreamProvider<List<Budget>>((ref) {
  final repository = ref.watch(budgetRepositoryProvider);
  final currentDate = ref.watch(currentBudgetMonthProvider);

  return repository.watchBudgetsForMonth(
    currentDate.month,
    currentDate.year,
  );
});

/// Provider for budgets with spending information
final budgetsWithSpendingProvider =
FutureProvider<List<BudgetWithSpending>>((ref) async {
  final repository = ref.watch(budgetRepositoryProvider);
  final currentDate = ref.watch(currentBudgetMonthProvider);

  return repository.getBudgetsWithSpending(
    currentDate.month,
    currentDate.year,
  );
});

/// Provider for budget summary
final budgetSummaryProvider = FutureProvider<BudgetSummary>((ref) async {
  final budgetsWithSpending = await ref.watch(budgetsWithSpendingProvider.future);

  if (budgetsWithSpending.isEmpty) {
    return const BudgetSummary(
      totalBudgeted: 0,
      totalSpent: 0,
      totalRemaining: 0,
      categoriesOverBudget: 0,
      categoriesNearLimit: 0,
    );
  }

  final totalBudgeted = budgetsWithSpending.fold(
    0.0,
        (sum, b) => sum + b.budget.amount,
  );

  final totalSpent = budgetsWithSpending.fold(
    0.0,
        (sum, b) => sum + b.spent,
  );

  final categoriesOverBudget = budgetsWithSpending
      .where((b) => b.status == BudgetStatus.exceeded)
      .length;

  final categoriesNearLimit = budgetsWithSpending
      .where((b) =>
  b.status == BudgetStatus.warning || b.status == BudgetStatus.danger)
      .length;

  return BudgetSummary(
    totalBudgeted: totalBudgeted,
    totalSpent: totalSpent,
    totalRemaining: totalBudgeted - totalSpent,
    categoriesOverBudget: categoriesOverBudget,
    categoriesNearLimit: categoriesNearLimit,
  );
});

/// Provider for budget actions
final budgetActionsProvider = Provider<BudgetActions>((ref) {
  final repository = ref.watch(budgetRepositoryProvider);
  return BudgetActions(repository);
});

/// Class containing all budget actions
class BudgetActions {
  final BudgetRepository _repository;

  BudgetActions(this._repository);

  Future<void> setBudget({
    required int categoryId,
    required double amount,
    required int month,
    required int year,
  }) async {
    await _repository.setBudget(
      categoryId: categoryId,
      amount: amount,
      month: month,
      year: year,
    );
  }

  Future<void> deleteBudget(int budgetId) async {
    await _repository.deleteBudget(budgetId);
  }

  Future<Budget?> getBudget(int categoryId, int month, int year) async {
    return await _repository.getBudget(categoryId, month, year);
  }

  Future<BudgetWithSpending?> getBudgetWithSpending(
      int categoryId,
      int month,
      int year,
      ) async {
    return await _repository.getBudgetWithSpending(categoryId, month, year);
  }
}

/// Budget summary model
class BudgetSummary {
  final double totalBudgeted;
  final double totalSpent;
  final double totalRemaining;
  final int categoriesOverBudget;
  final int categoriesNearLimit;

  const BudgetSummary({
    required this.totalBudgeted,
    required this.totalSpent,
    required this.totalRemaining,
    required this.categoriesOverBudget,
    required this.categoriesNearLimit,
  });
}