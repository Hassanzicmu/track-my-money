import 'package:flutter/material.dart';
import '../../../../domain/models/budget.dart';
import '../../../../domain/models/category.dart';
import '../../../../core/theme/app_colors.dart';
import 'budget_progress_bar.dart';

class BudgetCard extends StatelessWidget {
  final BudgetWithSpending budgetWithSpending;
  final Category category;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const BudgetCard({
    super.key,
    required this.budgetWithSpending,
    required this.category,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final budget = budgetWithSpending.budget;
    final spent = budgetWithSpending.spent;
    final remaining = budgetWithSpending.remaining;
    final status = budgetWithSpending.status;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Icon, Name, Delete
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      category.icon,
                      color: category.color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          status.displayName,
                          style: TextStyle(
                            fontSize: 13,
                            color: _getStatusColor(status, isDark),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 22),
                    onPressed: onDelete,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Progress Bar
              BudgetProgressBar(
                spent: spent,
                budget: budget.amount,
                status: status,
              ),
              const SizedBox(height: 12),

              // Remaining Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    remaining >= 0 ? 'Remaining' : 'Over Budget',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    remaining >= 0
                        ? '\$${remaining.toStringAsFixed(2)}'
                        : '\$${remaining.abs().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: remaining >= 0
                          ? (isDark ? AppColors.darkSuccess : AppColors.lightSuccess)
                          : (isDark ? AppColors.darkError : AppColors.lightError),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
