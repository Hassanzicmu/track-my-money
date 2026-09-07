import '../repositories/budget_repository.dart';
import '../repositories/transaction_repository.dart';
import '../models/notification_preferences.dart';
import 'notification_service.dart';

/// Service for checking and triggering budget alerts
class BudgetAlertService {
  final BudgetRepository _budgetRepo;
  final TransactionRepository _transactionRepo;
  final NotificationService _notificationService;

  BudgetAlertService(
      this._budgetRepo,
      this._transactionRepo,
      this._notificationService,
      );

  /// Check if budget alert should be triggered for a category
  Future<void> checkBudgetAlert(
      String categoryName,
      DateTime transactionDate,
      NotificationPreferences prefs,
      ) async {
    if (!prefs.enableBudgetAlerts) return;

    final month = transactionDate.month;
    final year = transactionDate.year;

    // Get all budgets for current month
    final budgets = await _budgetRepo.getBudgetsWithSpending(month, year);

    // Find budget for this category
    final categoryBudget = budgets.firstWhere(
          (b) => b.budget.categoryName == categoryName,
      orElse: () => null as dynamic,
    );

    if (categoryBudget == null) return;

    final percentage = categoryBudget.percentage;

    // Only alert at specific thresholds to avoid spam
    if (percentage >= 80 && percentage < 85) {
      await _notificationService.showBudgetAlert(
        category: categoryName,
        spent: categoryBudget.spent,
        budget: categoryBudget.budget.amount,
        percentage: percentage,
      );
    } else if (percentage >= 90 && percentage < 95) {
      await _notificationService.showBudgetAlert(
        category: categoryName,
        spent: categoryBudget.spent,
        budget: categoryBudget.budget.amount,
        percentage: percentage,
      );
    } else if (percentage >= 100 && percentage < 105) {
      await _notificationService.showBudgetAlert(
        category: categoryName,
        spent: categoryBudget.spent,
        budget: categoryBudget.budget.amount,
        percentage: percentage,
      );
    }
  }
}