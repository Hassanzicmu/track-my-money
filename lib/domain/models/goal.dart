import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    required int id,
    required String name,
    required double targetAmount,
    required double currentAmount,
    required DateTime targetDate,
    String? category,
    String? notes,
    required bool enableReminders,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

extension GoalCalculations on Goal {
  double get progressPercentage {
    if (targetAmount == 0) return 0;
    return ((currentAmount / targetAmount) * 100).clamp(0, 100);
  }

  double get remainingAmount => targetAmount - currentAmount;

  int get daysRemaining {
    final now = DateTime.now();
    final difference = targetDate.difference(DateTime(now.year, now.month, now.day));
    return difference.inDays;
  }

  bool get isCompleted => currentAmount >= targetAmount;

  bool get isOverdue => daysRemaining < 0 && !isCompleted;

  GoalStatus get status {
    if (isCompleted) return GoalStatus.completed;
    if (isOverdue) return GoalStatus.overdue;
    if (daysRemaining <= 30) return GoalStatus.urgent;
    return GoalStatus.active;
  }
}

enum GoalStatus {
  active,
  urgent,
  overdue,
  completed;

  String get displayName {
    switch (this) {
      case GoalStatus.active:
        return 'On Track';
      case GoalStatus.urgent:
        return 'Urgent';
      case GoalStatus.overdue:
        return 'Overdue';
      case GoalStatus.completed:
        return 'Completed';
    }
  }
}