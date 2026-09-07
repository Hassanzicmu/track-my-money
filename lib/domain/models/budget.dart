import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

/// Clean domain model for Budget
@freezed
class Budget with _$Budget {
  const factory Budget({
    required int id,
    required int categoryId,
    required String categoryName,
    required double amount,
    required int month,
    required int year,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) =>
      _$BudgetFromJson(json);
}

/// Budget status with spending information
@freezed
class BudgetWithSpending with _$BudgetWithSpending {
  const factory BudgetWithSpending({
    required Budget budget,
    required double spent,
    required double remaining,
    required double percentage,
    required BudgetStatus status,
  }) = _BudgetWithSpending;
}

/// Budget status enum
enum BudgetStatus {
  safe,      // < 70%
  warning,   // 70-90%
  danger,    // 90-100%
  exceeded;  // > 100%

  String get displayName {
    switch (this) {
      case BudgetStatus.safe:
        return 'On Track';
      case BudgetStatus.warning:
        return 'Near Limit';
      case BudgetStatus.danger:
        return 'Almost Over';
      case BudgetStatus.exceeded:
        return 'Exceeded';
    }
  }
}