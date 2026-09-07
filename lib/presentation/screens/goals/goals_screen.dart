import 'package:flutter/material.dart' hide VerticalDivider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_my_money/core/shared/card_components.dart';
import '../../providers/goal_provider.dart';
import 'add_contribution_dialog.dart';
import 'add_goal_dialog.dart';
import 'goal_card.dart';

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsProvider);
    final summaryAsync = ref.watch(goalsSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Goals'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Invalidate providers to refetch data
          ref.invalidate(goalsProvider);
          ref.invalidate(goalsSummaryProvider);
        },
        child: Column(
          children: [
            summaryAsync.when(
              data: (summary) => _buildSummary(context, summary),
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const SizedBox(),
            ),
            Expanded(
              child: goalsAsync.when(
                data: (goals) {
                  if (goals.isEmpty) {
                    // Make the empty state scrollable so pull-to-refresh works
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.flag,
                                      size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'No Goals Yet',
                                    style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Start planning your future',
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
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      final goal = goals[index];
                      return GoalCard(
                        goal: goal,
                        onTap: () => _editGoal(context, goal),
                        onAddContribution: () => _addContribution(context, goal),
                        onDelete: () => _deleteGoal(context, ref, goal.id),
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
        onPressed: () => _addGoal(context),
        icon: const Icon(Icons.add),
        label: const Text('New Goal'),
      ),
    );
  }

  Widget _buildSummary(BuildContext context, GoalsSummary summary) {
    if (summary.totalTarget == 0) return const SizedBox();

    final theme = Theme.of(context);
    // Use green color if all goals are completed
    final isCompleted = summary.progressPercentage >= 100;
    final primaryColor =
    isCompleted ? Colors.green : theme.colorScheme.primary;
    final onPrimary = isCompleted ? Colors.white : theme.colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardShell(
        primaryColor: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // This column ensures the header text is centered
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardLabel(label: 'Total Goals Progress', onPrimary: onPrimary),
                const SizedBox(height: 8),
                CardHeroValue(
                  value: '${summary.progressPercentage.toStringAsFixed(1)}%',
                  onPrimary: onPrimary,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (summary.progressPercentage / 100).clamp(0.0, 1.0),
                minHeight: 8,
                backgroundColor: onPrimary.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(onPrimary),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(
                  label: 'Saved',
                  value: '₹${summary.totalSaved.toStringAsFixed(0)}',
                  icon: Icons.savings_rounded,
                  iconColor: onPrimary.withOpacity(0.85),
                  onPrimary: onPrimary,
                ),
                VerticalDivider(onPrimary: onPrimary),
                StatItem(
                  label: 'Target',
                  value: '₹${summary.totalTarget.toStringAsFixed(0)}',
                  icon: Icons.flag_rounded,
                  iconColor: onPrimary.withOpacity(0.85),
                  onPrimary: onPrimary,
                ),
                VerticalDivider(onPrimary: onPrimary),
                StatItem(
                  label: 'Remaining',
                  value: '₹${summary.remaining.toStringAsFixed(0)}',
                  icon: Icons.hourglass_bottom_rounded,
                  iconColor: onPrimary.withOpacity(0.85),
                  onPrimary: onPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addGoal(BuildContext context) {
    showDialog(context: context, builder: (context) => const AddGoalDialog());
  }

  void _editGoal(BuildContext context, goal) {
    showDialog(
      context: context,
      builder: (context) => AddGoalDialog(goal: goal),
    );
  }

  void _addContribution(BuildContext context, goal) {
    showDialog(
      context: context,
      builder: (context) => AddContributionDialog(goal: goal),
    );
  }

  Future<void> _deleteGoal(BuildContext context, WidgetRef ref, int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Goal'),
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
      await ref.read(goalActionsProvider).deleteGoal(id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Goal deleted')),
        );
      }
    }
  }
}
