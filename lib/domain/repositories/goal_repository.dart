import '../models/goal.dart';

abstract class GoalRepository {
  Stream<List<Goal>> watchAllGoals();

  Stream<List<Goal>> watchActiveGoals();

  Future<Goal?> getGoalById(int id);

  Future<int> addGoal({
    required String name,
    required double targetAmount,
    required DateTime targetDate,
    double currentAmount = 0,
    String? category,
    String? notes,
    bool enableReminders = false,
  });

  Future<void> updateGoal(Goal goal);

  Future<void> deleteGoal(int id);

  Future<void> addContribution(int goalId, double amount);

  Future<double> getTotalGoalsTarget();

  Future<double> getTotalGoalsSaved();
}