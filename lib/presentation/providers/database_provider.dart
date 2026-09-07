import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/database/app_database.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/budget_repository_impl.dart';
import '../../data/repositories/recurring_transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/budget_repository.dart';
import '../../domain/repositories/recurring_transaction_repository.dart';
import '../../domain/services/recurring_transaction_service.dart';
import '../../domain/services/notification_service.dart';
import '../../domain/services/budget_alert_service.dart';
import '../../data/repositories/investment_repository_impl.dart';
import '../../domain/repositories/investment_repository.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../domain/repositories/goal_repository.dart';

/// Provides the database instance (singleton)
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Provides the transaction repository
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return TransactionRepositoryImpl(database);
});

/// Provides the category repository
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return CategoryRepositoryImpl(database);
});

/// Provides the budget repository
final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return BudgetRepositoryImpl(database);
});

/// Provides the recurring transaction repository
final recurringTransactionRepositoryProvider =
Provider<RecurringTransactionRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return RecurringTransactionRepositoryImpl(database);
});

/// Provides the recurring transaction service
final recurringTransactionServiceProvider =
Provider<RecurringTransactionService>((ref) {
  final recurringRepo = ref.watch(recurringTransactionRepositoryProvider);
  final transactionRepo = ref.watch(transactionRepositoryProvider);
  return RecurringTransactionService(recurringRepo, transactionRepo);
});

/// Provides the notification service (NEW)
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// Provides the budget alert service (NEW)
final budgetAlertServiceProvider = Provider<BudgetAlertService>((ref) {
  final budgetRepo = ref.watch(budgetRepositoryProvider);
  final transactionRepo = ref.watch(transactionRepositoryProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  return BudgetAlertService(budgetRepo, transactionRepo, notificationService);
});

final investmentRepositoryProvider = Provider<InvestmentRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return InvestmentRepositoryImpl(database);
});

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return GoalRepositoryImpl(database);
});