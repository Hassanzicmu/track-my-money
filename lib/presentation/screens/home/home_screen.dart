import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_my_money/core/shared/card_components.dart';
import 'package:track_my_money/presentation/screens/add_transaction/transaction_card.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_strings.dart';
import '../../../domain/models/transaction.dart';
import '../../providers/transaction_provider.dart';
import '../add_transaction/add_transaction_screen.dart';
import '../categories/categories_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.category_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesScreen(),
                ),
              );
            },
            tooltip: 'Manage Categories',
          ),
        ],
      ),
      body: transactionsAsync.when(
        data: (transactions) =>
            _buildTransactionList(context, ref, transactions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToAddTransaction(context),
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.add),
      ),
    );
  }

  Widget _buildTransactionList(
      BuildContext context,
      WidgetRef ref,
      List<Transaction> transactions,
      ) {
    if (transactions.isEmpty) {
      return _buildEmptyState(context);
    }

    // Calculate totals
    final totalIncome = transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);

    final totalExpense = transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);

    final balance = totalIncome - totalExpense;

    return Column(
      children: [
        // Summary Card
        _buildSummaryCard(context, totalIncome, totalExpense, balance),

        // Transaction List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 80),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return TransactionCard(
                transaction: transaction,
                onTap: () => _navigateToEditTransaction(context, transaction),
                onDelete: () => _showDeleteDialog(context, ref, transaction),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Summary Card showing totals
  Widget _buildSummaryCard(
      BuildContext context,
      double income,
      double expense,
      double balance,
      ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final incomeColor = isDark ? AppColors.darkIncome : AppColors.lightIncome;    final expenseColor = isDark
        ? AppColors.darkExpense
        : AppColors.lightExpense;
    final primaryColor = theme.colorScheme.primary;
    final onPrimary = theme.colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardShell(
        primaryColor: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardLabel(label: 'Total Balance', onPrimary: onPrimary),
            const SizedBox(height: 6),
            CardHeroValue(
              value: '\$${balance.toStringAsFixed(2)}',
              onPrimary: onPrimary,
            ),
            const SizedBox(height: 24),
            CardDividerRow(
              left: StatItem(
                label: 'Income',
                value: '\$${income.toStringAsFixed(2)}',
                icon: Icons.arrow_upward_rounded,
                iconColor: incomeColor,
                onPrimary: onPrimary,
              ),
              right: StatItem(
                label: 'Expense',
                value: '\$${expense.toStringAsFixed(2)}',
                icon: Icons.arrow_downward_rounded,
                iconColor: expenseColor,
                onPrimary: onPrimary,
              ),
              onPrimary: onPrimary,
            ),
          ],
        ),
      ),
    );
  }

  /// Empty state when no transactions
  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 80,
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.noTransactions,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.addFirstTransaction,
            style: TextStyle(
              color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  /// Navigate to add transaction screen
  void _navigateToAddTransaction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTransactionScreen()),
    );
  }

  /// Navigate to edit transaction screen
  void _navigateToEditTransaction(
      BuildContext context,
      Transaction transaction,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTransactionScreen(transaction: transaction),
      ),
    );
  }

  /// Show delete confirmation dialog
  Future<void> _showDeleteDialog(
      BuildContext context,
      WidgetRef ref,
      Transaction transaction,
      ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteTransactionTitle),
        content: const Text(AppStrings.deleteTransactionMessage),
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
      final actions = ref.read(transactionActionsProvider);
      await actions.deleteTransaction(transaction.id);

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Transaction deleted')));
      }
    }
  }
}
