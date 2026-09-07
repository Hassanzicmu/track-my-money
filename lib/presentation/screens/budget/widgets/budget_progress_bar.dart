import 'package:flutter/material.dart';
import '../../../../domain/models/budget.dart';
import '../../../../core/theme/app_colors.dart';

class BudgetProgressBar extends StatelessWidget {
  final double spent;
  final double budget;
  final BudgetStatus status;

  const BudgetProgressBar({
    super.key,
    required this.spent,
    required this.budget,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = budget > 0 ? (spent / budget).clamp(0.0, 1.0) : 0.0;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${spent.toStringAsFixed(2)} of \$${budget.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: _getStatusColor(status, isDark),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 12,
            backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
            valueColor: AlwaysStoppedAnimation(_getStatusColor(status, isDark)),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(BudgetStatus status, bool isDark) {
    switch (status) {
      case BudgetStatus.safe:
        return isDark ? AppColors.darkSuccess : AppColors.lightSuccess;
      case BudgetStatus.warning:
        return isDark ? AppColors.darkWarning : AppColors.lightWarning;
      case BudgetStatus.danger:
        return isDark ? AppColors.darkError : AppColors.lightError;
      case BudgetStatus.exceeded:
        return isDark ? AppColors.darkError : AppColors.lightError;
    }
  }
}
