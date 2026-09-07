import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/models/investment.dart';

class InvestmentCard extends StatelessWidget {
  final Investment investment;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const InvestmentCard({
    super.key,
    required this.investment,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Get Theme and ColorScheme for adaptive UI
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final dateFormatter = DateFormat('MMM dd, yyyy');
    final isProfit = investment.isProfit;

    // 2. Define theme-aware colors
    final profitColor = isDark ? Colors.green.shade300 : Colors.green.shade700;
    final lossColor = isDark ? Colors.red.shade300 : Colors.red.shade700;
    final gainLossColor = isProfit ? profitColor : lossColor;
    final subduedTextColor = theme.textTheme.bodySmall?.color;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.dividerColor, width: 1.0),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    investment.assetType.icon,
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          investment.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          investment.assetType.displayName,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: subduedTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 22),
                    onPressed: onDelete,
                    color: subduedTextColor,
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildValueColumn(
                    context,
                    'Invested',
                    '₹${investment.investedAmount.toStringAsFixed(0)}',
                    subduedTextColor!,
                  ),
                  _buildValueColumn(
                    context,
                    'Current Value',
                    '₹${investment.currentValue.toStringAsFixed(0)}',
                    colorScheme.primary,
                  ),
                  _buildValueColumn(
                    context,
                    isProfit ? 'Profit' : 'Loss',
                    '${isProfit ? '+' : ''}₹${investment.profitLoss.abs().toStringAsFixed(0)}',
                    gainLossColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 3. Use theme-aware background color
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: gainLossColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isProfit ? Icons.trending_up : Icons.trending_down,
                      size: 16,
                      color: gainLossColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${isProfit ? '+' : ''}${investment.growthPercentage.toStringAsFixed(2)}%',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: gainLossColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      dateFormatter.format(investment.investmentDate),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: subduedTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 4. Update _buildValueColumn to accept BuildContext for theming
  Widget _buildValueColumn(BuildContext context, String label, String value, Color color) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
