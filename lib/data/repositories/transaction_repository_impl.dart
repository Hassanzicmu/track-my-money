import 'package:drift/drift.dart' as drift;

import '../../domain/models/transaction.dart' as domain;
import '../../domain/repositories/transaction_repository.dart';
import '../local/database/app_database.dart';

/// Implementation of TransactionRepository using Drift database
class TransactionRepositoryImpl implements TransactionRepository {
  final AppDatabase _database;

  TransactionRepositoryImpl(this._database);

  @override
  Stream<List<domain.Transaction>> watchAllTransactions() {
    return _database.watchAllTransactions().map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Future<domain.Transaction?> getTransactionById(int id) async {
    final entity = await _database.getTransactionById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  @override
  Future<int> addTransaction({
    required double amount,
    required domain.TransactionType type,
    required String category,
    required DateTime date,
    String? note,
  }) {
    final companion = TransactionEntitiesCompanion(
      amountInCents: drift.Value(_dollarsTocents(amount)),
      type: drift.Value(type.name),
      category: drift.Value(category),
      date: drift.Value(date),
      note: drift.Value(note),
    );

    return _database.insertTransaction(companion);
  }

  @override
  Future<bool> updateTransaction(domain.Transaction transaction) {
    final entity = _modelToEntity(transaction);
    return _database.updateTransaction(entity);
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final entity = await _database.getTransactionById(id);
    if (entity != null) {
      await _database.deleteTransaction(entity);
    }
  }

  @override
  Stream<List<domain.Transaction>> watchTransactionsByType(
      domain.TransactionType type,
      ) {
    return _database
        .watchTransactionsByType(type.name)
        .map((entities) => entities.map(_entityToModel).toList());
  }

  @override
  Stream<List<domain.Transaction>> watchTransactionsByDateRange(
      DateTime startDate,
      DateTime endDate,
      ) {
    return _database
        .watchTransactionsByDateRange(startDate, endDate)
        .map((entities) => entities.map(_entityToModel).toList());
  }

  // ==========================================
  // HELPER METHODS: Convert between layers
  // ==========================================

  /// Convert database entity to domain model
  domain.Transaction _entityToModel(TransactionEntity entity) {
    return domain.Transaction(
      id: entity.id,
      amount: _centsToDollars(entity.amountInCents),
      type: domain.TransactionType.values.firstWhere(
            (e) => e.name == entity.type,
      ),
      category: entity.category,
      date: entity.date,
      note: entity.note,
      createdAt: entity.createdAt,
      recurringTransactionId: entity.recurringTransactionId, // NEW
    );
  }

  /// Convert domain model to database entity
  TransactionEntity _modelToEntity(domain.Transaction model) {
    return TransactionEntity(
      id: model.id,
      amountInCents: _dollarsTocents(model.amount),
      type: model.type.name,
      category: model.category,
      date: model.date,
      note: model.note,
      createdAt: model.createdAt,
      recurringTransactionId: model.recurringTransactionId, // NEW
    );
  }

  /// Convert dollars to cents (e.g., 10.50 → 1050)
  int _dollarsTocents(double dollars) {
    return (dollars * 100).round();
  }

  /// Convert cents to dollars (e.g., 1050 → 10.50)
  double _centsToDollars(int cents) {
    return cents / 100.0;
  }

  @override
  Future<int> getTransactionCount(DateTime startDate, DateTime endDate) async {
    final transactions = await _database
        .watchTransactionsByDateRange(startDate, endDate)
        .first;
    return transactions.length;
  }

  @override
  Future<double> getTotalIncome(DateTime startDate, DateTime endDate) async {
    final transactions = await _database
        .watchTransactionsByDateRange(startDate, endDate)
        .first;

    // FIX: Added <double> to fold to help the compiler
    return transactions
        .where((t) => t.type == 'income')
        .fold<double>(0.0, (sum, t) => sum + _centsToDollars(t.amountInCents));
  }

  @override
  Future<double> getTotalExpense(DateTime startDate, DateTime endDate) async {
    final transactions = await _database
        .watchTransactionsByDateRange(startDate, endDate)
        .first;

    // FIX: Added <double> to fold to help the compiler
    return transactions
        .where((t) => t.type == 'expense')
        .fold<double>(0.0, (sum, t) => sum + _centsToDollars(t.amountInCents));
  }

  @override
  Future<Map<String, double>> getExpenseByCategory(
      DateTime startDate,
      DateTime endDate,
      ) async {
    final transactions = await _database
        .watchTransactionsByDateRange(startDate, endDate)
        .first;

    final expenses = transactions.where((t) => t.type == 'expense');

    final Map<String, double> categoryMap = {};

    for (var transaction in expenses) {
      final amount = _centsToDollars(transaction.amountInCents);
      categoryMap[transaction.category] =
          (categoryMap[transaction.category] ?? 0) + amount;
    }

    return categoryMap;
  }

  @override
  Future<Map<String, double>> getIncomeByCategory(
      DateTime startDate,
      DateTime endDate,
      ) async {
    final transactions = await _database
        .watchTransactionsByDateRange(startDate, endDate)
        .first;

    final incomes = transactions.where((t) => t.type == 'income');

    final Map<String, double> categoryMap = {};

    for (var transaction in incomes) {
      final amount = _centsToDollars(transaction.amountInCents);
      categoryMap[transaction.category] =
          (categoryMap[transaction.category] ?? 0) + amount;
    }

    return categoryMap;
  }


  @override
  Future<void> insertTransactions(List<domain.Transaction> transactions) async {  final companions = transactions.map((t) {
    // CORRECTED: Removed `createdAt` and fixed syntax.
    return TransactionEntitiesCompanion.insert(
      amountInCents: _dollarsTocents(t.amount),
      type: t.type.name,
      category: t.category,
      date: t.date,
      note: drift.Value(t.note),
      recurringTransactionId: drift.Value(t.recurringTransactionId),
    );
  }).toList();

  await _database.batch((batch) {
    batch.insertAll(_database.transactionEntities, companions);
  });
  }

  @override
  Future<void> clearAllTransactions() async {
    await _database.delete(_database.transactionEntities).go();
  }

}
