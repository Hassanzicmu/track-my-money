import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_strings.dart';
import '../../providers/dashboard_provider.dart';
import '../categories/categories_screen.dart';
import '../settings/settings_screen.dart';
import 'budget_summary_widget.dart';
import 'expense_chart.dart';
import 'recent_transactions_widget.dart';
import 'summary_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRange = ref.watch(selectedDateRangeProvider);
    final statsAsync = ref.watch(dashboardStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardStatsProvider);
        },
        child: ListView(
          // Unified padding for the entire screen content
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          clipBehavior: Clip.none, // Allows shadows to paint outside the list bounds
          children: [
            // Date Range Selector
            _buildDateRangeSelector(context, ref, selectedRange),
            const SizedBox(height: 16),

            // Stats
            statsAsync.when(
              data: (stats) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure full width
                children: [
                  // Summary Card
                  SummaryCard(stats: stats),
                  const SizedBox(height: 16), // Consistent spacing

                  // Budget Summary
                  const BudgetSummaryWidget(),
                  const SizedBox(height: 16),

                  // Expense Chart
                  if (stats.totalExpense > 0) ...[
                    Text(
                      'Expense Breakdown',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const ExpenseChart(),
                    const SizedBox(height: 24),
                  ],

                  // Recent Transactions
                  Text(
                    'Recent Transactions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const RecentTransactionsWidget(),
                ],
              ),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) =>
                  Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRangeSelector(
      BuildContext context,
      WidgetRef ref,
      DateRange selectedRange,
      ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: DateRange.values.map((range) {
          final isSelected = range == selectedRange;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(range.displayName),
              selected: isSelected,
              checkmarkColor: Theme.of(context).colorScheme.onPrimary,
              selectedColor: Theme.of(context).colorScheme.primary,
              onSelected: (selected) {
                if (selected) {
                  ref.read(selectedDateRangeProvider.notifier).state =
                      range;
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
