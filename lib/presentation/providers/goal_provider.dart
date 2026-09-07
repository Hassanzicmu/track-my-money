import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/goal.dart';
import '../../domain/repositories/goal_repository.dart';
import 'database_provider.dart';

final goalsProvider = StreamProvider<List<Goal>>((ref) {
  final repository = ref.watch(goalRepositoryProvider);
  return repository.watchAllGoals();
});

final activeGoalsProvider = StreamProvider<List<Goal>>((ref) {
  final repository = ref.watch(goalRepositoryProvider);
  return repository.watchActiveGoals();
});

final goalsSummaryProvider = FutureProvider<GoalsSummary>((ref) async {
  final repository = ref.watch(goalRepositoryProvider);

  final totalTarget = await repository.getTotalGoalsTarget();
  final totalSaved = await repository.getTotalGoalsSaved();
  final progress = totalTarget > 0 ? (totalSaved / totalTarget) * 100 : 0.toDouble();


  return GoalsSummary(
    totalTarget: totalTarget,
    totalSaved: totalSaved,
    progressPercentage: progress,
  );
});

final goalActionsProvider = Provider<GoalActions>((ref) {
  final repository = ref.watch(goalRepositoryProvider);
  return GoalActions(repository);
});

class GoalActions {
  final GoalRepository _repository;

  GoalActions(this._repository);

  Future<void> addGoal({
    required String name,
    required double targetAmount,
    required DateTime targetDate,
    double currentAmount = 0,
    String? category,
    String? notes,
    bool enableReminders = false,
  }) async {
    await _repository.addGoal(
      name: name,
      targetAmount: targetAmount,
      targetDate: targetDate,
      currentAmount: currentAmount,
      category: category,
      notes: notes,
      enableReminders: enableReminders,
    );
  }

  Future<void> updateGoal(Goal goal) async {
    await _repository.updateGoal(goal);
  }

  Future<void> deleteGoal(int id) async {
    await _repository.deleteGoal(id);
  }

  Future<void> addContribution(int goalId, double amount) async {
    await _repository.addContribution(goalId, amount);
  }
}

class GoalsSummary {
  final double totalTarget;
  final double totalSaved;
  final double progressPercentage;

  GoalsSummary({
    required this.totalTarget,
    required this.totalSaved,
    required this.progressPercentage,
  });

  double get remaining => totalTarget - totalSaved;
}