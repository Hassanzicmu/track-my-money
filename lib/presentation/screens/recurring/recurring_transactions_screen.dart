import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_strings.dart';
import '../../../domain/models/recurring_transaction.dart';
import '../../providers/category_provider.dart';
import '../../providers/recurring_transaction_provider.dart';
import 'add_recurring_dialog.dart';
import 'widgets/recurring_card.dart';

class RecurringTransactionsScreen extends ConsumerWidget {
  const RecurringTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recurringAsync = ref.watch(recurringTransactionsProvider);

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
            tooltip: 'About Recurring',
          ),
        ],
      ),
      body: recurringAsync.when(
        data: (recurrences) =>
            _buildRecurringList(context, ref, recurrences),
        loading: () =>
        const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRecurringDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Recurring'),
      ),
    );
  }

  Widget _buildRecurringList(
      BuildContext context,
      WidgetRef ref,
      List<RecurringTransaction> recurrences,
      ) {
    if (recurrences.isEmpty) {
      return _buildEmptyState(context);
    }
    // Separate active and paused
    final active = recurrences.where((r) => r.isActive).toList();
    final paused = recurrences.where((r) => !r.isActive).toList();

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(recurringTransactionsProvider);
      },
      child: ListView(
        padding: const EdgeInsets.only(top: 16, bottom: 80),
        children: [
          // Active Section
          if (active.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                'Active (${active.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ...active.map(
                  (recurring) =>
                  _buildRecurringCard(context, ref, recurring),
            ),
          ],

          // Paused Section
          if (paused.isNotEmpty) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                'Paused (${paused.length})',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey),
              ),
            ),
            ...paused.map(
                  (recurring) =>
                  _buildRecurringCard(context, ref, recurring),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRecurringCard(
      BuildContext context,
      WidgetRef ref,
      RecurringTransaction recurring,
      ) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final actions = ref.read(recurringTransactionActionsProvider);

    return categoriesAsync.when(
      data: (categories) {
        final category = categories.firstWhere(
              (cat) => cat.id == recurring.categoryId,
          orElse: () => categories.first,
        );

        return RecurringCard(
          recurring: recurring,
          category: category,
          nextDueDescription: actions.getNextDueDescription(
            recurring,
          ),
          onTap: () => _editRecurring(context, recurring),
          onTogglePause: () => _togglePause(context, ref, recurring),
          onDelete: () => _deleteRecurring(context, ref, recurring),
        );
      },
      loading: () => const SizedBox(),
      error: (_, __) => const SizedBox(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.repeat,
              size: 80,
              color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'No Recurring Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Set up recurring income or expenses\nto automate your tracking',
              style: TextStyle(
                  color: isDark ? Colors.grey.shade500 : Colors.grey.shade500
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddRecurringDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddRecurringDialog(),
    );
  }

  void _editRecurring(
      BuildContext context,
      RecurringTransaction recurring,
      ) {
    showDialog(
      context: context,
      builder: (context) => AddRecurringDialog(recurring: recurring),
    );
  }

  Future<void> _togglePause(
      BuildContext context,
      WidgetRef ref,
      RecurringTransaction recurring,
      ) async {
    final actions = ref.read(recurringTransactionActionsProvider);
    if (recurring.isActive) {
      await actions.pauseRecurringTransaction(recurring.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Recurring transaction paused'),
          ),
        );
      }
    } else {
      await actions.resumeRecurringTransaction(recurring.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Recurring transaction resumed'),
          ),
        );
      }
    }
  }

  Future<void> _deleteRecurring(
      BuildContext context,
      WidgetRef ref,
      RecurringTransaction recurring,
      ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recurring'),
        content: Text(
          'Delete recurring transaction for ${recurring.categoryName}?\n\n'
              'This will not delete already generated transactions.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final actions = ref.read(recurringTransactionActionsProvider);
      await actions.deleteRecurringTransaction(recurring.id);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Recurring transaction deleted'),
          ),
        );
      }
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Recurring'),
        content: const Text(
          'Recurring transactions automatically create transactions on a schedule.\n\n'
              '• Daily: Every day\n'
              '• Weekly: Every 7 days\n'
              '• Monthly: Same day each month\n\n'
              'The app will generate transactions even if you don\'t open it for a while.\n\n'
              'You can pause or delete recurring transactions anytime.',
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
