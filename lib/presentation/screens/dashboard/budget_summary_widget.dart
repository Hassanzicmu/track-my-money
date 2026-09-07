import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../providers/budget_provider.dart';
import '../budget/budget_screen.dart';

class BudgetSummaryWidget extends ConsumerWidget {
  const BudgetSummaryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(budgetSummaryProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return summaryAsync.when(
      data: (summary) {
        if (summary.totalBudgeted == 0) {
          // No budgets set - show prompt
          return Card(
            margin: EdgeInsets.zero,
            // CHANGED: Remove default card margin
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BudgetScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(
                            0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: theme.colorScheme.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Your Budget',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Track spending and stay on target',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          );
        }

        // ... existing variable calculations ...
        final percentage = summary.totalBudgeted > 0
            ? (summary.totalSpent / summary.totalBudgeted) * 100
            : 0.0;

        // ... colors ...
        final successColor = isDark
            ? AppColors.darkSuccess
            : AppColors.lightSuccess;
        final warningColor = isDark
            ? AppColors.darkWarning
            : AppColors.lightWarning;
        final errorColor = isDark ? AppColors.darkError : AppColors
            .lightError;

        return Card(
          margin: EdgeInsets.zero,
          // CHANGED: Remove default card margin
          child: InkWell(
            // ... existing inkwell ...
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const BudgetScreen()));
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // ... existing children ...
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... rest of the widget code is same ...
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Budget Overview',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: (percentage / 100).clamp(0.0, 1.0),
                      minHeight: 10,
                      backgroundColor: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation(
                        _getProgressColor(
                            percentage, successColor, warningColor,
                            errorColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem(
                          context, 'Spent', summary.totalSpent,
                          warningColor),
                      _buildStatItem(
                          context, 'Budget', summary.totalBudgeted,
                          theme.colorScheme.primary),
                      _buildStatItem(
                          context, 'Left', summary.totalRemaining,
                          summary.totalRemaining >= 0
                              ? successColor
                              : errorColor),
                    ],
                  ),

                  // Warnings (Keep existing logic)
                  if (summary.categoriesOverBudget > 0 ||
                      summary.categoriesNearLimit > 0) ...[
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 8),
                    if (summary.categoriesOverBudget > 0)
                      _buildWarningRow(
                          '${summary.categoriesOverBudget} ${summary
                              .categoriesOverBudget == 1
                              ? 'category'
                              : 'categories'} over budget',
                          errorColor, Icons.error_outline),
                    if (summary.categoriesNearLimit > 0)
                      _buildWarningRow(
                          '${summary.categoriesNearLimit} ${summary
                              .categoriesNearLimit == 1
                              ? 'category'
                              : 'categories'} near limit',
                          warningColor, Icons.warning_amber_rounded),
                  ],
                ],
              ),
            ),
          ),
        );
      },
      loading: () => Card(
        margin: EdgeInsets.zero, // CHANGED
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const SizedBox(),
    );
  }

  // ... keep _buildStatItem, _buildWarningRow, _getProgressColor ...
  Widget _buildStatItem(BuildContext context, String label,
      double amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildWarningRow(String text, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getProgressColor(double percentage, Color success,
      Color warning, Color error) {
    if (percentage > 100) return error.withOpacity(0.8);
    if (percentage >= 90) return error;
    if (percentage >= 70) return warning;
    return success;
  }
}
