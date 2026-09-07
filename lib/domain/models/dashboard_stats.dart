import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';

/// Dashboard statistics model
@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required double totalIncome,
    required double totalExpense,
    required double balance,
    required Map<String, double> expenseByCategory,
    required Map<String, double> incomeByCategory,
    required int transactionCount,
  }) = _DashboardStats;
}

/// Category spending data for charts
@freezed
class CategorySpending with _$CategorySpending {
  const factory CategorySpending({
    required String categoryName,
    required double amount,
    required double percentage,
    required int color,
    required int iconCodePoint,
  }) = _CategorySpending;
}