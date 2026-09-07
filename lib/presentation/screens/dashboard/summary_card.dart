import 'package:flutter/material.dart';
import 'package:track_my_money/core/shared/card_components.dart';import '../../../../core/theme/app_colors.dart';
import '../../../../domain/models/dashboard_stats.dart';

class SummaryCard extends StatelessWidget {
  final DashboardStats stats;

  const SummaryCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = theme.colorScheme.primary;
    final onPrimary = theme.colorScheme.onPrimary;
    final incomeColor = isDark ? AppColors.darkIncome : AppColors.lightIncome;
    final expenseColor = isDark ? AppColors.darkExpense : AppColors.lightExpense;

    return CardShell(
      primaryColor: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardLabel(label: 'Total Balance', onPrimary: onPrimary),
          const SizedBox(height: 4),
          CardHeroValue(
              value: '\$${stats.balance.toStringAsFixed(2)}',
              onPrimary: onPrimary),
          const SizedBox(height: 16),
          CardDividerRow(
            left: StatItem(
              label: 'Income',
              value: '\$${stats.totalIncome.toStringAsFixed(2)}',
              icon: Icons.arrow_upward_rounded,
              iconColor: incomeColor,
              onPrimary: onPrimary,
            ),
            right: StatItem(
              label: 'Expense',
              value: '\$${stats.totalExpense.toStringAsFixed(2)}',
              icon: Icons.arrow_downward_rounded,
              iconColor: expenseColor,
              onPrimary: onPrimary,
            ),
            onPrimary: onPrimary,
          ),
          const SizedBox(height: 16),
          Center(
            child: CardPill(
                label: '${stats.transactionCount} transactions',
                onPrimary: onPrimary),
          ),
        ],
      ),
    );
  }
}
