import 'package:flutter/material.dart';import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../providers/recurring_transaction_provider.dart';
import '../recurring/recurring_transactions_screen.dart';

class RecurringSummaryWidget extends ConsumerWidget {
  const RecurringSummaryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recurringAsync = ref.watch(
      activeRecurringTransactionsProvider,
    );

    return recurringAsync.when(
      data: (recurrences) {
        if (recurrences.isEmpty) {
          return const SizedBox();
        }

        final dueToday = recurrences.where((r) {
          final now = DateTime.now();
          final nextDue = r.nextDueDate;
          return now.year == nextDue.year &&
              now.month == nextDue.month &&
              now.day == nextDue.day;
        }).length;

        final isDark = Theme.of(context).brightness == Brightness.dark;

        // Use secondary color for recurring (usually orange/teal in the palette)
        final iconColor = Theme.of(context).colorScheme.secondary;
        final warningColor = isDark ? AppColors.darkWarning : AppColors.lightWarning;

        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const RecurringTransactionsScreen(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.repeat,
                      color: iconColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recurring Transactions',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${recurrences.length} active${dueToday > 0 ? ' • $dueToday due today' : ''}',
                          style: TextStyle(
                            fontSize: 13,
                            color: dueToday > 0
                                ? warningColor
                                : Theme.of(context).textTheme.bodySmall?.color,
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
      },
      loading: () => const SizedBox(),
      error: (_, __) => const SizedBox(),
    );
  }
}
