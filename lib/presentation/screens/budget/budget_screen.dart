import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/models/budget.dart';
import '../../providers/budget_provider.dart';
import '../../providers/category_provider.dart';
import 'set_budget_dialog.dart';
import 'widgets/budget_card.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDate = ref.watch(currentBudgetMonthProvider);
    final budgetsWithSpendingAsync = ref.watch(
      budgetsWithSpendingProvider,
    );
    final summaryAsync = ref.watch(budgetSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showInfoDialog(context),
            tooltip: 'About Budgets',
          ),
        ],
      ),
      body: Column(
        children: [
          // Month Selector
          _buildMonthSelector(context, ref, currentDate),

          // Budget Summary Card
          summaryAsync.when(
            data: (summary) => _buildSummaryCard(context, summary),
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(),
            ),
            error: (_, __) => const SizedBox(),
          ),

          // Budget List
          Expanded(
            child: budgetsWithSpendingAsync.when(
              data: (budgets) =>
                  _buildBudgetList(context, ref, budgets),
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSetBudgetDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Budget'),
      ),
    );
  }

  Widget _buildMonthSelector(
      BuildContext context,
      WidgetRef ref,
      DateTime currentDate,
      ) {
    final formatter = DateFormat('MMMM yyyy');

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              final newDate = DateTime(
                currentDate.year,
                currentDate.month - 1,
              );
              ref.read(currentBudgetMonthProvider.notifier).state =
                  newDate;
            },
          ),
          Text(
            formatter.format(currentDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              final newDate = DateTime(
                currentDate.year,
                currentDate.month + 1,
              );
              ref.read(currentBudgetMonthProvider.notifier).state =
                  newDate;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
      BuildContext context,
      BudgetSummary summary,
      ) {
    if (summary.totalBudgeted == 0) {
      return const SizedBox();
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  'Budgeted',
                  summary.totalBudgeted,
                  Colors.blue,
                ),
                _buildSummaryItem(
                  'Spent',
                  summary.totalSpent,
                  isDark ? AppColors.darkWarning : AppColors.lightWarning,
                ),
                _buildSummaryItem(
                  'Remaining',
                  summary.totalRemaining,
                  summary.totalRemaining >= 0
                      ? (isDark ? AppColors.darkSuccess : AppColors.lightSuccess)
                      : (isDark ? AppColors.darkError : AppColors.lightError),
                ),
              ],
            ),
            if (summary.categoriesOverBudget > 0 ||
                summary.categoriesNearLimit > 0) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              if (summary.categoriesOverBudget > 0)
                _buildWarning(
                  '${summary.categoriesOverBudget} ${summary.categoriesOverBudget == 1 ? 'category' : 'categories'} over budget',
                  isDark ? AppColors.darkError : AppColors.lightError,
                ),
              if (summary.categoriesNearLimit > 0)
                _buildWarning(
                  '${summary.categoriesNearLimit} ${summary.categoriesNearLimit == 1 ? 'category' : 'categories'} near limit',
                  isDark ? AppColors.darkWarning : AppColors.lightWarning,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, double amount, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildWarning(String text, Color color) {
    return Row(
      children: [
        Icon(Icons.warning_amber_rounded, color: color, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetList(
      BuildContext context,
      WidgetRef ref,
      List<BudgetWithSpending> budgets,
      ) {
    if (budgets.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(budgetsWithSpendingProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        itemCount: budgets.length,
        itemBuilder: (context, index) {
          final budgetWithSpending = budgets[index];
          final categoriesAsync = ref.watch(categoriesProvider);

          return categoriesAsync.when(
            data: (categories) {
              final category = categories.firstWhere(
                    (cat) =>
                cat.id == budgetWithSpending.budget.categoryId,
              );

              return BudgetCard(
                budgetWithSpending: budgetWithSpending,
                category: category,
                onTap: () => _editBudget(
                  context,
                  category,
                  budgetWithSpending.budget.amount,
                ),
                onDelete: () => _deleteBudget(
                  context,
                  ref,
                  budgetWithSpending.budget,
                ),
              );
            },
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            const Text(
              'No Budgets Set',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the + button to set your first budget',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showSetBudgetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SetBudgetDialog(),
    );
  }

  void _editBudget(
      BuildContext context,
      category,
      double existingAmount,
      ) {
    showDialog(
      context: context,
      builder: (context) => SetBudgetDialog(
        category: category,
        existingAmount: existingAmount,
      ),
    );
  }

  Future<void> _deleteBudget(
      BuildContext context,
      WidgetRef ref,
      Budget budget,
      ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Budget'),
        content: Text(
          'Delete budget for ${budget.categoryName}? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final actions = ref.read(budgetActionsProvider);
      await actions.deleteBudget(budget.id);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Budget deleted')),
        );
      }
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Budgets'),
        content: const Text(
          'Set monthly spending limits for your expense categories.\n\n'
              '• Green: Under 70% - You\'re doing great!\n'
              '• Orange: 70-90% - Getting close to limit\n'
              '• Red: Over 90% - Slow down on spending\n\n'
              'Budgets help you stay on track with your financial goals.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
