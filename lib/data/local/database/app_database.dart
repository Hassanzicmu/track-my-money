import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../entities/goal_entity.dart';
import '../entities/budget_entity.dart';
import '../entities/category_entity.dart';
import '../entities/recurring_transaction_entity.dart'; // NEW
import '../entities/transaction_entity.dart';
import '../entities/investment_entity.dart';

part 'app_database.g.dart';

/// Main database class
@DriftDatabase(tables: [
  TransactionEntities,
  CategoryEntities,
  BudgetEntities,
  RecurringTransactionEntities,
  InvestmentEntities,
  GoalEntities,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _insertDefaultCategories();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Migration from version 1 to 2 (categories)
        if (from < 2) {
          await m.createTable(categoryEntities);
          await _insertDefaultCategories();
        }

        // Migration from version 2 to 3 (budgets)
        if (from < 3) {
          await m.createTable(budgetEntities);
        }

        // Migration from version 3 to 4 (recurring transactions) - NEW
        if (from < 4) {
          // Create recurring transactions table
          await m.createTable(recurringTransactionEntities);

          // Add recurringTransactionId column to existing transactions table
          await m.addColumn(transactionEntities,
              transactionEntities.recurringTransactionId);
        }

        // NEW: Migration for investments
        if (from < 5) {
          await m.createTable(investmentEntities);
        }
        if (from < 6) {
          await m.createTable(goalEntities);
        }
      },
    );
  }


  // ==========================================
  // TRANSACTION QUERIES (existing - keep all)
  // ==========================================

  Stream<List<TransactionEntity>> watchAllTransactions() {
    return (select(transactionEntities)
      ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
      ]))
        .watch();
  }

  Future<TransactionEntity?> getTransactionById(int id) {
    return (select(transactionEntities)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertTransaction(TransactionEntitiesCompanion transaction) {
    return into(transactionEntities).insert(transaction);
  }

  Future<bool> updateTransaction(TransactionEntity transaction) {
    return update(transactionEntities).replace(transaction);
  }

  Future<int> deleteTransaction(TransactionEntity transaction) {
    return delete(transactionEntities).delete(transaction);
  }

  Stream<List<TransactionEntity>> watchTransactionsByType(String type) {
    return (select(transactionEntities)
      ..where((t) => t.type.equals(type))
      ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
      ]))
        .watch();
  }

  Stream<List<TransactionEntity>> watchTransactionsByDateRange(
      DateTime startDate,
      DateTime endDate,
      ) {
    return (select(transactionEntities)
      ..where((t) => t.date.isBiggerOrEqualValue(startDate))
      ..where((t) => t.date.isSmallerOrEqualValue(endDate))
      ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
      ]))
        .watch();
  }

  Future<int> getTransactionCount(DateTime startDate, DateTime endDate) async {
    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;
    return transactions.length;
  }

  Future<double> getTotalIncome(DateTime startDate, DateTime endDate) async {
    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;
    return transactions
        .where((t) => t.type == 'income')
        .fold<double>(0.0, (sum, t) => sum + (t.amountInCents / 100.0));
  }

  Future<double> getTotalExpense(DateTime startDate, DateTime endDate) async {
    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;
    return transactions
        .where((t) => t.type == 'expense')
        .fold<double>(0.0, (sum, t) => sum + (t.amountInCents / 100.0));
  }

  Future<Map<String, double>> getExpenseByCategory(
      DateTime startDate,
      DateTime endDate,
      ) async {
    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;
    final expenses = transactions.where((t) => t.type == 'expense');
    final Map<String, double> categoryMap = {};

    for (var transaction in expenses) {
      final amount = transaction.amountInCents / 100.0;
      categoryMap[transaction.category] =
          (categoryMap[transaction.category] ?? 0) + amount;
    }

    return categoryMap;
  }

  Future<Map<String, double>> getIncomeByCategory(
      DateTime startDate,
      DateTime endDate,
      ) async {
    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;
    final incomes = transactions.where((t) => t.type == 'income');
    final Map<String, double> categoryMap = {};

    for (var transaction in incomes) {
      final amount = transaction.amountInCents / 100.0;
      categoryMap[transaction.category] =
          (categoryMap[transaction.category] ?? 0) + amount;
    }

    return categoryMap;
  }

  // ==========================================
  // CATEGORY QUERIES (existing - keep all)
  // ==========================================

  Stream<List<CategoryEntity>> watchAllCategories() {
    return (select(categoryEntities)
      ..orderBy([(c) => OrderingTerm(expression: c.name)]))
        .watch();
  }

  Stream<List<CategoryEntity>> watchCategoriesByType(String type) {
    return (select(categoryEntities)
      ..where((c) => c.type.equals(type))
      ..orderBy([(c) => OrderingTerm(expression: c.name)]))
        .watch();
  }

  Future<CategoryEntity?> getCategoryById(int id) {
    return (select(categoryEntities)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertCategory(CategoryEntitiesCompanion category) {
    return into(categoryEntities).insert(category);
  }

  Future<bool> updateCategory(CategoryEntity category) {
    return update(categoryEntities).replace(category);
  }

  Future<int> deleteCategory(CategoryEntity category) {
    return delete(categoryEntities).delete(category);
  }

  Future<bool> categoryNameExists(String name, String type) async {
    final result = await (select(categoryEntities)
      ..where((c) => c.name.equals(name) & c.type.equals(type)))
        .getSingleOrNull();
    return result != null;
  }

  // ==========================================
  // BUDGET QUERIES (existing - keep all)
  // ==========================================

  Stream<List<BudgetEntity>> watchBudgetsForMonth(int month, int year) {
    return (select(budgetEntities)
      ..where((b) => b.month.equals(month) & b.year.equals(year)))
        .watch();
  }

  Future<BudgetEntity?> getBudget(int categoryId, int month, int year) {
    return (select(budgetEntities)
      ..where((b) =>
      b.categoryId.equals(categoryId) &
      b.month.equals(month) &
      b.year.equals(year)))
        .getSingleOrNull();
  }

  Future<void> setBudget(BudgetEntitiesCompanion budget) async {
    await into(budgetEntities).insertOnConflictUpdate(budget);
  }

  Future<int> deleteBudget(BudgetEntity budget) {
    return delete(budgetEntities).delete(budget);
  }

  Future<int> deleteBudgetsForCategory(int categoryId) {
    return (delete(budgetEntities)..where((b) => b.categoryId.equals(categoryId))).go();
  }

  Future<double> getSpentForCategory(int categoryId, int month, int year) async {
    final category = await getCategoryById(categoryId);
    if (category == null) return 0.0;

    final startDate = DateTime(year, month, 1);
    final endDate = DateTime(year, month + 1, 0, 23, 59, 59);

    final transactions = await watchTransactionsByDateRange(startDate, endDate).first;

    final spent = transactions
        .where((t) => t.category == category.name && t.type == 'expense')
        .fold(0.0, (sum, t) => sum + (t.amountInCents / 100.0));

    return spent;
  }

  // ==========================================
  // RECURRING TRANSACTION QUERIES (NEW)
  // ==========================================

  /// Watch all recurring transactions
  Stream<List<
      RecurringTransactionEntity>> watchAllRecurringTransactions() {
    return (select(recurringTransactionEntities)
      ..orderBy([(r) => OrderingTerm(expression: r.nextDueDate)]))
        .watch();
  }

  /// Watch active recurring transactions only
  Stream<List<
      RecurringTransactionEntity>> watchActiveRecurringTransactions() {
    return (select(recurringTransactionEntities)
      ..where((r) => r.isActive.equals(true))
      ..orderBy([(r) => OrderingTerm(expression: r.nextDueDate)]))
        .watch();
  }

  /// Get recurring transactions that are due (nextDueDate <= today and active)
  Future<List<
      RecurringTransactionEntity>> getDueRecurringTransactions() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day, 23, 59, 59);

    return await (select(recurringTransactionEntities)
      ..where((r) =>
      r.isActive.equals(true) & r.nextDueDate.isSmallerOrEqualValue(
          today)))
        .get();
  }

  /// Get a single recurring transaction by ID
  Future<RecurringTransactionEntity?> getRecurringTransactionById(
      int id) {
    return (select(recurringTransactionEntities)
      ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  /// Insert a new recurring transaction
  Future<int> insertRecurringTransaction(
      RecurringTransactionEntitiesCompanion recurring,) {
    return into(recurringTransactionEntities).insert(recurring);
  }

  /// Update a recurring transaction
  Future<bool> updateRecurringTransaction(
      RecurringTransactionEntity recurring) {
    return update(recurringTransactionEntities).replace(recurring);
  }

  /// Delete a recurring transaction
  Future<int> deleteRecurringTransaction(
      RecurringTransactionEntity recurring) {
    return delete(recurringTransactionEntities).delete(recurring);
  }

  /// Check if a transaction exists for a specific recurring ID and date
  Future<bool> transactionExistsForRecurringAndDate(int recurringId,
      DateTime date,) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(
        date.year, date.month, date.day, 23, 59, 59);

    final result = await (select(transactionEntities)
      ..where((t) =>
      t.recurringTransactionId.equals(recurringId) &
      t.date.isBiggerOrEqualValue(startOfDay) &
      t.date.isSmallerOrEqualValue(endOfDay)))
        .getSingleOrNull();

    return result != null;
  }

  /// Get all transactions generated from a specific recurring ID and date
  Stream<List<TransactionEntity>> watchTransactionsByRecurringId(
      int recurringId) {
    return (select(transactionEntities)
      ..where((t) => t.recurringTransactionId.equals(recurringId))
      ..orderBy([
            (t) =>
            OrderingTerm(expression: t.date, mode: OrderingMode.desc)
      ]))
        .watch();
  }

  // ==========================================
  // INVESTMENT QUERIES (NEW)
  // ==========================================

  Stream<List<InvestmentEntity>> watchAllInvestments() {
    return (select(investmentEntities)
      ..orderBy([(i) => OrderingTerm(expression: i.investmentDate, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Watch investments by asset type
  Stream<List<InvestmentEntity>> watchInvestmentsByType(String assetType) {
    return (select(investmentEntities)
      ..where((i) => i.assetType.equals(assetType))
      ..orderBy([(i) => OrderingTerm(expression: i.investmentDate, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Get investments by ID
  Future<InvestmentEntity?> getInvestmentById(int id) {
    return (select(investmentEntities)..where((i) => i.id.equals(id)))
        .getSingleOrNull();
  }

  /// Insert investments
  Future<int> insertInvestment(InvestmentEntitiesCompanion investment) {
    return into(investmentEntities).insert(investment);
  }

  /// Update investments
  Future<bool> updateInvestment(InvestmentEntity investment) {
    return update(investmentEntities).replace(investment);
  }

  /// Delete investments
  Future<int> deleteInvestment(InvestmentEntity investment) {
    return delete(investmentEntities).delete(investment);
  }

  /// Get total portfolio value
  Future<double> getTotalPortfolioValue() async {
    final investments = await select(investmentEntities).get();
    return investments.fold<double>(0.0, (sum, inv) => sum + (inv.currentValue / 100.0));
  }

  /// Get total invested amount
  Future<double> getTotalInvestedAmount() async {
    final investments = await select(investmentEntities).get();
    return investments.fold<double>(0.0, (sum, inv) => sum + (inv.investedAmount / 100.0));
  }


  // ==========================================
// GOAL QUERIES
// ==========================================

  Stream<List<GoalEntity>> watchAllGoals() {
    return (select(goalEntities)
      ..orderBy([(g) => OrderingTerm(expression: g.targetDate)]))
        .watch();
  }

  Stream<List<GoalEntity>> watchActiveGoals() {
    return (select(goalEntities)
      ..where((g) => g.currentAmount.isSmallerThan(g.targetAmount))
      ..orderBy([(g) => OrderingTerm(expression: g.targetDate)]))
        .watch();
  }

  Future<GoalEntity?> getGoalById(int id) {
    return (select(goalEntities)..where((g) => g.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertGoal(GoalEntitiesCompanion goal) {
    return into(goalEntities).insert(goal);
  }

  Future<bool> updateGoal(GoalEntity goal) {
    return update(goalEntities).replace(goal);
  }

  Future<int> deleteGoal(GoalEntity goal) {
    return delete(goalEntities).delete(goal);
  }

  Future<double> getTotalGoalsTarget() async {
    final goals = await select(goalEntities).get();
    return goals.fold<double>(0.0, (sum, g) => sum + (g.targetAmount / 100.0));
  }

  Future<double> getTotalGoalsSaved() async {
    final goals = await select(goalEntities).get();
    return goals.fold<double>(0.0, (sum, g) => sum + (g.currentAmount / 100.0));
  }

  // ==========================================
  // DEFAULT CATEGORIES SETUP (existing - keep)
  // ==========================================

  Future<void> _insertDefaultCategories() async {
    final expenseCategories = [
      {'name': 'Food & Dining', 'icon': 0xe57f, 'color': 0xFFFF6B6B},
      {'name': 'Transportation', 'icon': 0xe539, 'color': 0xFF4ECDC4},
      {'name': 'Shopping', 'icon': 0xe59c, 'color': 0xFFFFBE0B},
      {'name': 'Entertainment', 'icon': 0xe30a, 'color': 0xFFFF006E},
      {'name': 'Bills & Utilities', 'icon': 0xe1c9, 'color': 0xFF8338EC},
      {'name': 'Healthcare', 'icon': 0xe3f0, 'color': 0xFFEF476F},
      {'name': 'Education', 'icon': 0xe80c, 'color': 0xFF06FFA5},
      {'name': 'Rent', 'icon': 0xe318, 'color': 0xFF118AB2},
      {'name': 'Other Expense', 'icon': 0xe5cc, 'color': 0xFF9E9E9E},
    ];

    for (var cat in expenseCategories) {
      await into(categoryEntities).insert(
        CategoryEntitiesCompanion.insert(
          name: cat['name'] as String,
          type: 'expense',
          iconCodePoint: cat['icon'] as int,
          colorValue: cat['color'] as int,
          isDefault: const Value(true),
        ),
      );
    }

    final incomeCategories = [
      {'name': 'Salary', 'icon': 0xe227, 'color': 0xFF06D6A0},
      {'name': 'Freelance', 'icon': 0xe30c, 'color': 0xFF00B4D8},
      {'name': 'Business', 'icon': 0xe0af, 'color': 0xFF7209B7},
      {'name': 'Investment', 'icon': 0xe1d0, 'color': 0xFFF77F00},
      {'name': 'Gift', 'icon': 0xe83f, 'color': 0xFFE63946},
      {'name': 'Other Income', 'icon': 0xe145, 'color': 0xFF2A9D8F},
    ];

    for (var cat in incomeCategories) {
      await into(categoryEntities).insert(
        CategoryEntitiesCompanion.insert(
          name: cat['name'] as String,
          type: 'income',
          iconCodePoint: cat['icon'] as int,
          colorValue: cat['color'] as int,
          isDefault: const Value(true),
        ),
      );
    }
  }
}

/// Opens the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'track_my_money.db'));
    return NativeDatabase(file);
  });
}