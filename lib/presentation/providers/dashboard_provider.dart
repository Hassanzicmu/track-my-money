import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/dashboard_stats.dart';
import 'database_provider.dart';

/// Date range for dashboard
enum DateRange { thisMonth, lastMonth, thisYear, allTime }

/// Provider for selected date range
final selectedDateRangeProvider = StateProvider<DateRange>((ref) {
  return DateRange.thisMonth;
});

/// Provider that calculates dashboard statistics
final dashboardStatsProvider = FutureProvider<DashboardStats>((
  ref,
) async {
  final dateRange = ref.watch(selectedDateRangeProvider);
  final transactionRepo = ref.watch(transactionRepositoryProvider);

  final dates = _getDateRange(dateRange);

  final totalIncome = await transactionRepo.getTotalIncome(
    dates.start,
    dates.end,
  );

  final totalExpense = await transactionRepo.getTotalExpense(
    dates.start,
    dates.end,
  );

  final expenseByCategory = await transactionRepo
      .getExpenseByCategory(dates.start, dates.end);

  final incomeByCategory = await transactionRepo.getIncomeByCategory(
    dates.start,
    dates.end,
  );

  final transactionCount = await transactionRepo.getTransactionCount(
    dates.start,
    dates.end,
  );

  return DashboardStats(
    totalIncome: totalIncome,
    totalExpense: totalExpense,
    balance: totalIncome - totalExpense,
    expenseByCategory: expenseByCategory,
    incomeByCategory: incomeByCategory,
    transactionCount: transactionCount,
  );
});

/// Provider for category spending with colors and icons
final categorySpendingProvider =
    FutureProvider<List<CategorySpending>>((ref) async {
      final stats = await ref.watch(dashboardStatsProvider.future);
      final categoryRepo = ref.watch(categoryRepositoryProvider);
      final allCategories = await categoryRepo
          .watchAllCategories()
          .first;

      final totalExpense = stats.totalExpense;
      if (totalExpense == 0) return [];

      final List<CategorySpending> spending = [];

      for (var entry in stats.expenseByCategory.entries) {
        final category = allCategories.firstWhere(
          (cat) => cat.name == entry.key,
          orElse: () => allCategories.first, // Fallback
        );

        spending.add(
          CategorySpending(
            categoryName: entry.key,
            amount: entry.value,
            percentage: (entry.value / totalExpense) * 100,
            color: category.color.value,
            iconCodePoint: category.icon.codePoint,
          ),
        );
      }

      // Sort by amount descending
      spending.sort((a, b) => b.amount.compareTo(a.amount));

      return spending;
    });

/// Helper to get date range
({DateTime start, DateTime end}) _getDateRange(DateRange range) {
  final now = DateTime.now();

  switch (range) {
    case DateRange.thisMonth:
      return (
        start: DateTime(now.year, now.month, 1),
        end: DateTime(now.year, now.month + 1, 0, 23, 59, 59),
      );

    case DateRange.lastMonth:
      final lastMonth = DateTime(now.year, now.month - 1, 1);
      return (
        start: lastMonth,
        end: DateTime(
          lastMonth.year,
          lastMonth.month + 1,
          0,
          23,
          59,
          59,
        ),
      );

    case DateRange.thisYear:
      return (
        start: DateTime(now.year, 1, 1),
        end: DateTime(now.year, 12, 31, 23, 59, 59),
      );

    case DateRange.allTime:
      return (
        start: DateTime(2000, 1, 1),
        end: DateTime(2100, 12, 31, 23, 59, 59),
      );
  }
}

extension DateRangeExtension on DateRange {
  String get displayName {
    switch (this) {
      case DateRange.thisMonth:
        return 'This Month';
      case DateRange.lastMonth:
        return 'Last Month';
      case DateRange.thisYear:
        return 'This Year';
      case DateRange.allTime:
        return 'All Time';
    }
  }
}
