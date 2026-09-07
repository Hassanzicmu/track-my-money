import 'package:drift/drift.dart' as drift;
import '../../domain/models/investment.dart';
import '../../domain/repositories/investment_repository.dart';
import '../local/database/app_database.dart';

class InvestmentRepositoryImpl implements InvestmentRepository {
  final AppDatabase _database;

  InvestmentRepositoryImpl(this._database);

  @override
  Stream<List<Investment>> watchAllInvestments() {
    return _database.watchAllInvestments().map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Stream<List<Investment>> watchInvestmentsByType(AssetType type) {
    return _database.watchInvestmentsByType(type.name).map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Future<Investment?> getInvestmentById(int id) async {
    final entity = await _database.getInvestmentById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  @override
  Future<int> addInvestment({
    required String name,
    required AssetType assetType,
    required double investedAmount,
    required double currentValue,
    required DateTime investmentDate,
    DateTime? maturityDate,
    String? notes,
    bool isRecurring = false,
    double? recurringAmount,
  }) {
    final companion = InvestmentEntitiesCompanion(
      name: drift.Value(name),
      assetType: drift.Value(assetType.name),
      investedAmount: drift.Value(_dollarsToCents(investedAmount)),
      currentValue: drift.Value(_dollarsToCents(currentValue)),
      investmentDate: drift.Value(investmentDate),
      maturityDate: drift.Value(maturityDate),
      notes: drift.Value(notes),
      isRecurring: drift.Value(isRecurring),
      recurringAmount: drift.Value(recurringAmount != null ? _dollarsToCents(recurringAmount) : null),
    );

    return _database.insertInvestment(companion);
  }

  @override
  Future<void> updateInvestment(Investment investment) async {
    final entity = _modelToEntity(investment);
    await _database.updateInvestment(entity);
  }

  @override
  Future<void> deleteInvestment(int id) async {
    final entity = await _database.getInvestmentById(id);
    if (entity != null) {
      await _database.deleteInvestment(entity);
    }
  }

  @override
  Future<double> getTotalPortfolioValue() {
    return _database.getTotalPortfolioValue();
  }

  @override
  Future<double> getTotalInvestedAmount() {
    return _database.getTotalInvestedAmount();
  }

  Investment _entityToModel(InvestmentEntity entity) {
    return Investment(
      id: entity.id,
      name: entity.name,
      assetType: AssetType.values.firstWhere((e) => e.name == entity.assetType),
      investedAmount: _centsToDollars(entity.investedAmount),
      currentValue: _centsToDollars(entity.currentValue),
      investmentDate: entity.investmentDate,
      maturityDate: entity.maturityDate,
      notes: entity.notes,
      isRecurring: entity.isRecurring,
      recurringAmount: entity.recurringAmount != null ? _centsToDollars(entity.recurringAmount!) : null,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  InvestmentEntity _modelToEntity(Investment model) {
    return InvestmentEntity(
      id: model.id,
      name: model.name,
      assetType: model.assetType.name,
      investedAmount: _dollarsToCents(model.investedAmount),
      currentValue: _dollarsToCents(model.currentValue),
      investmentDate: model.investmentDate,
      maturityDate: model.maturityDate,
      notes: model.notes,
      isRecurring: model.isRecurring,
      recurringAmount: model.recurringAmount != null ? _dollarsToCents(model.recurringAmount!) : null,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  int _dollarsToCents(double dollars) => (dollars * 100).round();
  double _centsToDollars(int cents) => cents / 100.0;
}