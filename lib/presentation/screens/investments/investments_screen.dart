import 'package:flutter/material.dart' hide VerticalDivider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_my_money/core/shared/card_components.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/investment_provider.dart';
import 'widgets/add_investment_dialog.dart';
import 'widgets/investment_card.dart';

class InvestmentsScreen extends ConsumerWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final investmentsAsync = ref.watch(investmentsProvider);
    final portfolioAsync = ref.watch(portfolioSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Investments')),
      // 1. Wrap the body with a RefreshIndicator
      body: RefreshIndicator(
        // 2. Implement the onRefresh callback
        onRefresh: () async {
          // Invalidate providers to refetch data
          ref.invalidate(investmentsProvider);
          ref.invalidate(portfolioSummaryProvider);
          // The Future returned by the providers will be awaited by the indicator
        },
        child: Column(
          children: [
            // Portfolio Summary
            portfolioAsync.when(
              data: (summary) => _buildSummary(context, summary),
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const SizedBox(),
            ),

            // Investments List
            Expanded(
              child: investmentsAsync.when(
                data: (investments) {
                  if (investments.isEmpty) {
                    // Make the empty state scrollable so pull-to-refresh works
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.trending_up,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'No Investments Yet',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Start tracking your wealth',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return ListView.builder(
                    // Ensure the ListView is always scrollable for the refresh indicator
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: investments.length,
                    itemBuilder: (context, index) {
                      final investment = investments[index];
                      return InvestmentCard(
                        investment: investment,
                        onTap: () => _editInvestment(context, investment),
                        onDelete: () =>
                            _deleteInvestment(context, ref, investment.id),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addInvestment(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Investment'),
      ),
    );
  }

  Widget _buildSummary(BuildContext context, PortfolioSummary summary) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimary = theme.colorScheme.onPrimary;
    final isProfit = summary.profitLoss >= 0;
    final plColor = isProfit ? AppColors.lightIncome : AppColors.lightExpense;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardShell(
        primaryColor: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardLabel(label: 'Portfolio Value', onPrimary: onPrimary),
            const SizedBox(height: 6),
            CardHeroValue(
              value: '₹${summary.totalValue.toStringAsFixed(0)}',
              onPrimary: onPrimary,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(
                  label: 'Invested',
                  value: '₹${summary.totalInvested.toStringAsFixed(0)}',
                  icon: Icons.account_balance_wallet_rounded,
                  iconColor: onPrimary.withOpacity(0.8),
                  onPrimary: onPrimary,
                ),
                VerticalDivider(onPrimary: onPrimary),
                StatItem(
                  label: isProfit ? 'Profit' : 'Loss',
                  value: '₹${summary.profitLoss.abs().toStringAsFixed(0)}',
                  icon: isProfit
                      ? Icons.trending_up_rounded
                      : Icons.trending_down_rounded,
                  iconColor: plColor,
                  onPrimary: onPrimary,
                ),
                VerticalDivider(onPrimary: onPrimary),
                StatItem(
                  label: 'Growth',
                  value: '${summary.growthPercentage.toStringAsFixed(1)}%',
                  icon: Icons.bar_chart_rounded,
                  iconColor: plColor,
                  onPrimary: onPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addInvestment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddInvestmentDialog(),
    );
  }

  void _editInvestment(BuildContext context, investment) {
    showDialog(
      context: context,
      builder: (context) => AddInvestmentDialog(investment: investment),
    );
  }

  Future<void> _deleteInvestment(
      BuildContext context,
      WidgetRef ref,
      int id,
      ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Investment'),
        content: const Text('Are you sure? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(investmentActionsProvider).deleteInvestment(id);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Investment deleted')));
      }
    }
  }
}
