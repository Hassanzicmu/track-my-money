import 'package:drift/drift.dart' as drift;
import '../../domain/models/budget.dart' as domain;
import '../../domain/repositories/budget_repository.dart';
import '../local/database/app_database.dart';

/// Implementation of BudgetRepository using Drift database
class BudgetRepositoryImpl implements BudgetRepository {
  final AppDatabase _database;

  BudgetRepositoryImpl(this._database);


  @override
  Stream<List<domain.Budget>> watchBudgetsForMonth(int month, int year) {
    return _database.watchBudgetsForMonth(month, year).asyncMap((entities) async {
      final List<domain.Budget> budgets = [];

      for (var entity in entities) {
        final category = await _database.getCategoryById(entity.categoryId);
        if (category != null) {
          budgets.add(_entityToModel(entity, category.name));
        }
      }

      return budgets;
    });
  }

  @override
  Future<domain.Budget?> getBudget(int categoryId, int month, int year) async {
    final entity = await _database.getBudget(categoryId, month, year);
    if (entity == null) return null;

    final category = await _database.getCategoryById(categoryId);
    if (category == null) return null;

    return _entityToModel(entity, category.name);
  }

  @override
  Future<void> setBudget({
    required int categoryId,
    required double amount,
    required int month,
    required int year,
  }) async {
    final companion = BudgetEntitiesCompanion(
      categoryId: drift.Value(categoryId),
      amountInCents: drift.Value(_dollarsToCents(amount)),
      month: drift.Value(month),
      year: drift.Value(year),
      updatedAt: drift.Value(DateTime.now()),
    );

    await _database.setBudget(companion);
  }

  @override
  Future<void> deleteBudget(int budgetId) async {
    final budget = await (_database.select(_database.budgetEntities)
      ..where((b) => b.id.equals(budgetId)))
        .getSingleOrNull();

    if (budget != null) {
      await _database.deleteBudget(budget);
    }
  }

  @override
  Future<double> getSpentForCategory(int categoryId, int month, int year) {
    return _database.getSpentForCategory(categoryId, month, year);
  }

  @override
  Future<domain.BudgetWithSpending?> getBudgetWithSpending(
      int categoryId,
      int month,
      int year,
      ) async {
    final budget = await getBudget(categoryId, month, year);
    if (budget == null) return null;

    final spent = await getSpentForCategory(categoryId, month, year);
    final remaining = budget.amount - spent;
    final percentage = (spent / budget.amount) * 100;

    return domain.BudgetWithSpending(
      budget: budget,
      spent: spent,
      remaining: remaining,
      percentage: percentage,
      status: _calculateStatus(percentage),
    );
  }

  @override
  Future<List<domain.BudgetWithSpending>> getBudgetsWithSpending(
      int month,
      int year,
      ) async {
    final budgets = await watchBudgetsForMonth(month, year).first;
    final List<domain.BudgetWithSpending> result = [];

    for (var budget in budgets) {
      final spending = await getBudgetWithSpending(
        budget.categoryId,
        month,
        year,
      );
      if (spending != null) {
        result.add(spending);
      }
    }

    return result;
  }

  // ==========================================
  // HELPER METHODS
  // ==========================================

  domain.Budget _entityToModel(BudgetEntity entity, String categoryName) {
    return domain.Budget(
      id: entity.id,
      categoryId: entity.categoryId,
      categoryName: categoryName,
      amount: _centsToDollars(entity.amountInCents),
      month: entity.month,
      year: entity.year,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  int _dollarsToCents(double dollars) {
    return (dollars * 100).round();
  }

  double _centsToDollars(int cents) {
    return cents / 100.0;
  }

  domain.BudgetStatus _calculateStatus(double percentage) {
    if (percentage > 100) return domain.BudgetStatus.exceeded;
    if (percentage >= 90) return domain.BudgetStatus.danger;
    if (percentage >= 70) return domain.BudgetStatus.warning;
    return domain.BudgetStatus.safe;
  }

  @override
  Stream<List<domain.Budget>> watchAllBudgets() {
    return _database.select(_database.budgetEntities).watch().asyncMap((entities) async {
      final List<domain.Budget> budgets = [];

      for (var entity in entities) {
        final category = await _database.getCategoryById(entity.categoryId);
        if (category != null) {
          budgets.add(_entityToModel(entity, category.name));
        }
      }

      return budgets;
    });
  }


  @override
  Future<void> insertBudgets(List<domain.Budget> budgets) async {
    final companions = budgets.map((b) {
      // CORRECTED: Removed `createdAt` and `updatedAt`.
      return BudgetEntitiesCompanion.insert(
        categoryId: b.categoryId,
        amountInCents: _dollarsToCents(b.amount),
        month: b.month,
        year: b.year,
      );
    }).toList();

    await _database.batch((batch) {
      batch.insertAll(_database.budgetEntities, companions);
    });
  }

  @override
  Future<void> clearAllBudgets() async {
    await _database.delete(_database.budgetEntities).go();
  }



}