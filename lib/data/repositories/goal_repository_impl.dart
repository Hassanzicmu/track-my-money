import 'package:drift/drift.dart' as drift;
import '../../domain/models/goal.dart';
import '../../domain/repositories/goal_repository.dart';
import '../local/database/app_database.dart';

class GoalRepositoryImpl implements GoalRepository {
  final AppDatabase _database;

  GoalRepositoryImpl(this._database);

  @override
  Stream<List<Goal>> watchAllGoals() {
    return _database.watchAllGoals().map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Stream<List<Goal>> watchActiveGoals() {
    return _database.watchActiveGoals().map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Future<Goal?> getGoalById(int id) async {
    final entity = await _database.getGoalById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  @override
  Future<int> addGoal({
    required String name,
    required double targetAmount,
    required DateTime targetDate,
    double currentAmount = 0,
    String? category,
    String? notes,
    bool enableReminders = false,
  }) {
    final companion = GoalEntitiesCompanion(
      name: drift.Value(name),
      targetAmount: drift.Value(_dollarsToCents(targetAmount)),
      currentAmount: drift.Value(_dollarsToCents(currentAmount)),
      targetDate: drift.Value(targetDate),
      category: drift.Value(category),
      notes: drift.Value(notes),
      enableReminders: drift.Value(enableReminders),
    );

    return _database.insertGoal(companion);
  }

  @override
  Future<void> updateGoal(Goal goal) async {
    final entity = _modelToEntity(goal);
    await _database.updateGoal(entity);
  }

  @override
  Future<void> deleteGoal(int id) async {
    final entity = await _database.getGoalById(id);
    if (entity != null) {
      await _database.deleteGoal(entity);
    }
  }

  @override
  Future<void> addContribution(int goalId, double amount) async {
    final goal = await getGoalById(goalId);
    if (goal != null) {
      final updated = goal.copyWith(
        currentAmount: goal.currentAmount + amount,
        updatedAt: DateTime.now(),
      );
      await updateGoal(updated);
    }
  }

  @override
  Future<double> getTotalGoalsTarget() {
    return _database.getTotalGoalsTarget();
  }

  @override
  Future<double> getTotalGoalsSaved() {
    return _database.getTotalGoalsSaved();
  }

  Goal _entityToModel(GoalEntity entity) {
    return Goal(
      id: entity.id,
      name: entity.name,
      targetAmount: _centsToDollars(entity.targetAmount),
      currentAmount: _centsToDollars(entity.currentAmount),
      targetDate: entity.targetDate,
      category: entity.category,
      notes: entity.notes,
      enableReminders: entity.enableReminders,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  GoalEntity _modelToEntity(Goal model) {
    return GoalEntity(
      id: model.id,
      name: model.name,
      targetAmount: _dollarsToCents(model.targetAmount),
      currentAmount: _dollarsToCents(model.currentAmount),
      targetDate: model.targetDate,
      category: model.category,
      notes: model.notes,
      enableReminders: model.enableReminders,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  int _dollarsToCents(double dollars) => (dollars * 100).round();
  double _centsToDollars(int cents) => cents / 100.0;
}