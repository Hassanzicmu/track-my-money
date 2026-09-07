import 'package:drift/drift.dart' as drift;
import '../../domain/models/recurring_transaction.dart' as domain;
import '../../domain/repositories/recurring_transaction_repository.dart';
import '../local/database/app_database.dart';

/// Implementation of RecurringTransactionRepository using Drift database
class RecurringTransactionRepositoryImpl implements RecurringTransactionRepository {
  final AppDatabase _database;

  RecurringTransactionRepositoryImpl(this._database);

  @override
  Stream<List<domain.RecurringTransaction>> watchAllRecurringTransactions() {
    return _database.watchAllRecurringTransactions().asyncMap((entities) async {
      final List<domain.RecurringTransaction> result = [];

      for (var entity in entities) {
        final category = await _database.getCategoryById(entity.categoryId);
        if (category != null) {
          result.add(_entityToModel(entity, category.name));
        }
      }

      return result;
    });
  }

  @override
  Stream<List<domain.RecurringTransaction>> watchActiveRecurringTransactions() {
    return _database.watchActiveRecurringTransactions().asyncMap((entities) async {
      final List<domain.RecurringTransaction> result = [];

      for (var entity in entities) {
        final category = await _database.getCategoryById(entity.categoryId);
        if (category != null) {
          result.add(_entityToModel(entity, category.name));
        }
      }

      return result;
    });
  }

  @override
  Future<List<domain.RecurringTransaction>> getDueRecurringTransactions() async {
    final entities = await _database.getDueRecurringTransactions();
    final List<domain.RecurringTransaction> result = [];

    for (var entity in entities) {
      final category = await _database.getCategoryById(entity.categoryId);
      if (category != null) {
        result.add(_entityToModel(entity, category.name));
      }
    }

    return result;
  }

  @override
  Future<domain.RecurringTransaction?> getRecurringTransactionById(int id) async {
    final entity = await _database.getRecurringTransactionById(id);
    if (entity == null) return null;

    final category = await _database.getCategoryById(entity.categoryId);
    if (category == null) return null;

    return _entityToModel(entity, category.name);
  }

  @override
  Future<int> createRecurringTransaction({
    required double amount,
    required String type,
    required int categoryId,
    required domain.RecurrenceFrequency frequency,
    required DateTime startDate,
    DateTime? endDate,
    String? note,
  }) {
    final companion = RecurringTransactionEntitiesCompanion(
      amountInCents: drift.Value(_dollarsToCents(amount)),
      type: drift.Value(type),
      categoryId: drift.Value(categoryId),
      frequency: drift.Value(frequency.name),
      startDate: drift.Value(startDate),
      endDate: drift.Value(endDate),
      nextDueDate: drift.Value(startDate), // First due date is start date
      note: drift.Value(note),
      isActive: const drift.Value(true),
    );

    return _database.insertRecurringTransaction(companion);
  }

  @override
  Future<bool> updateRecurringTransaction(domain.RecurringTransaction recurring) {
    final entity = _modelToEntity(recurring);
    return _database.updateRecurringTransaction(entity);
  }

  @override
  Future<void> deleteRecurringTransaction(int id) async {
    final entity = await _database.getRecurringTransactionById(id);
    if (entity != null) {
      await _database.deleteRecurringTransaction(entity);
    }
  }

  @override
  Future<void> pauseRecurringTransaction(int id) async {
    final entity = await _database.getRecurringTransactionById(id);
    if (entity != null) {
      final updated = entity.copyWith(isActive: false);
      await _database.updateRecurringTransaction(updated);
    }
  }

  @override
  Future<void> resumeRecurringTransaction(int id) async {
    final entity = await _database.getRecurringTransactionById(id);
    if (entity != null) {
      final updated = entity.copyWith(isActive: true);
      await _database.updateRecurringTransaction(updated);
    }
  }

  @override
  Future<void> updateGenerationDates(
      int id,
      DateTime lastGenerated,
      DateTime nextDueDate,
      ) async {
    final entity = await _database.getRecurringTransactionById(id);
    if (entity != null) {
      final updated = entity.copyWith(
        lastGenerated: drift.Value(lastGenerated),
        nextDueDate: nextDueDate,
        updatedAt: DateTime.now(),
      );
      await _database.updateRecurringTransaction(updated);
    }
  }

  @override
  Future<bool> transactionExistsForDate(int recurringId, DateTime date) {
    return _database.transactionExistsForRecurringAndDate(recurringId, date);
  }

  // ==========================================
  // HELPER METHODS
  // ==========================================

  domain.RecurringTransaction _entityToModel(
      RecurringTransactionEntity entity,
      String categoryName,
      ) {
    return domain.RecurringTransaction(
      id: entity.id,
      amount: _centsToDollars(entity.amountInCents),
      type: entity.type,
      categoryId: entity.categoryId,
      categoryName: categoryName,
      frequency: domain.RecurrenceFrequency.values.firstWhere(
            (e) => e.name == entity.frequency,
      ),
      startDate: entity.startDate,
      endDate: entity.endDate,
      lastGenerated: entity.lastGenerated,
      nextDueDate: entity.nextDueDate,
      note: entity.note,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  RecurringTransactionEntity _modelToEntity(domain.RecurringTransaction model) {
    return RecurringTransactionEntity(
      id: model.id,
      amountInCents: _dollarsToCents(model.amount),
      type: model.type,
      categoryId: model.categoryId,
      frequency: model.frequency.name,
      startDate: model.startDate,
      endDate: model.endDate,
      lastGenerated: model.lastGenerated,
      nextDueDate: model.nextDueDate,
      note: model.note,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  int _dollarsToCents(double dollars) {
    return (dollars * 100).round();
  }

  double _centsToDollars(int cents) {
    return cents / 100.0;
  }


  // --- ADD THIS IMPLEMENTATION ---


  @override
  Future<void> insertRecurringTransactions(
      List<domain.RecurringTransaction> recurring) async {
    final companions = recurring.map((r) {
      // CORRECTED: Removed `createdAt` and `updatedAt`.
      return RecurringTransactionEntitiesCompanion.insert(
        amountInCents: _dollarsToCents(r.amount),
        type: r.type,
        categoryId: r.categoryId,
        frequency: r.frequency.name,
        startDate: r.startDate,
        endDate: drift.Value(r.endDate),
        lastGenerated: drift.Value(r.lastGenerated),
        nextDueDate: r.nextDueDate,
        note: drift.Value(r.note),
        // CORRECTED: Wrapped the boolean value in drift.Value()
        isActive: drift.Value(r.isActive),
      );
    }).toList();

    await _database.batch((batch) {
      batch.insertAll(_database.recurringTransactionEntities, companions);
    });
  }

  @override
  Future<void> clearAllRecurringTransactions() async {
    await _database.delete(_database.recurringTransactionEntities).go();
  }



}