import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/theme_provider.dart';
import '../../providers/notification_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final notificationPrefs = ref.watch(notificationPreferencesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notifications Section (NEW)
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              ),
            ),
            child: Column(
              children: [
                // Morning Reminder
                SwitchListTile(
                  value: notificationPrefs.enableMorningReminder,
                  onChanged: (value) {
                    ref
                        .read(notificationPreferencesProvider.notifier)
                        .toggleMorningReminder(value);
                  },
                  title: const Text('Morning Reminder'),
                  subtitle: Text(
                    notificationPrefs.enableMorningReminder
                        ? 'Daily at ${_formatTime(notificationPrefs.morningReminderTime)}'
                        : 'Disabled',
                  ),
                  secondary: const Icon(Icons.wb_sunny_outlined),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                if (notificationPrefs.enableMorningReminder) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 0, 16, 16),
                    child: Row(
                      children: [
                        const Text('Time: '),
                        TextButton(
                          onPressed: () =>
                              _pickTime(context, ref, 'morning'),
                          child: Text(
                            _formatTime(notificationPrefs.morningReminderTime),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const Divider(height: 1),

                // Evening Reminder
                SwitchListTile(
                  value: notificationPrefs.enableEveningReminder,
                  onChanged: (value) {
                    ref
                        .read(notificationPreferencesProvider.notifier)
                        .toggleEveningReminder(value);
                  },
                  title: const Text('Evening Reminder'),
                  subtitle: Text(
                    notificationPrefs.enableEveningReminder
                        ? 'Daily at ${_formatTime(notificationPrefs.eveningReminderTime)}'
                        : 'Disabled',
                  ),
                  secondary: const Icon(Icons.nights_stay_outlined),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                if (notificationPrefs.enableEveningReminder) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 0, 16, 16),
                    child: Row(
                      children: [
                        const Text('Time: '),
                        TextButton(
                          onPressed: () =>
                              _pickTime(context, ref, 'evening'),
                          child: Text(
                            _formatTime(notificationPrefs.eveningReminderTime),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const Divider(height: 1),

                // Daily Summary
                SwitchListTile(
                  value: notificationPrefs.enableDailySummary,
                  onChanged: (value) {
                    ref
                        .read(notificationPreferencesProvider.notifier)
                        .toggleDailySummary(value);
                  },
                  title: const Text('Daily Summary'),
                  subtitle: Text(
                    notificationPrefs.enableDailySummary
                        ? 'Daily at ${_formatTime(notificationPrefs.dailySummaryTime)}'
                        : 'Disabled',
                  ),
                  secondary: const Icon(Icons.summarize_outlined),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                if (notificationPrefs.enableDailySummary) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 0, 16, 16),
                    child: Row(
                      children: [
                        const Text('Time: '),
                        TextButton(
                          onPressed: () =>
                              _pickTime(context, ref, 'summary'),
                          child: Text(
                            _formatTime(notificationPrefs.dailySummaryTime),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const Divider(height: 1),

                // Budget Alerts
                SwitchListTile(
                  value: notificationPrefs.enableBudgetAlerts,
                  onChanged: (value) {
                    ref
                        .read(notificationPreferencesProvider.notifier)
                        .toggleBudgetAlerts(value);
                  },
                  title: const Text('Budget Alerts'),
                  subtitle: const Text('Get notified at 80%, 90%, 100%'),
                  secondary: const Icon(Icons.account_balance_wallet_outlined),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),

                const Divider(height: 1),

                // Monthly Summary
                SwitchListTile(
                  value: notificationPrefs.enableMonthlySummary,
                  onChanged: (value) {
                    ref
                        .read(notificationPreferencesProvider.notifier)
                        .toggleMonthlySummary(value);
                  },
                  title: const Text('Monthly Summary'),
                  subtitle: const Text('End-of-month financial summary'),
                  secondary: const Icon(Icons.calendar_month_outlined),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Theme Section (Existing)
          const Text(
            'Appearance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              ),
            ),
            child: Column(
              children: AppThemeMode.values.map((mode) {
                final isSelected = currentTheme == mode;

                return RadioListTile<AppThemeMode>(
                  value: mode,
                  groupValue: currentTheme,
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(themeModeProvider.notifier)
                          .setThemeMode(value);
                    }
                  },
                  title: Text(mode.displayName),
                  subtitle: Text(_getThemeDescription(mode)),
                  activeColor: Theme.of(context).colorScheme.primary,
                  selected: isSelected,
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 32),

          // App Info (Existing)
          const Text(
            'About',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Version'),
                  subtitle: const Text('1.0.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('Build Number'),
                  subtitle: const Text('1'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getThemeDescription(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'Always use light theme';
      case AppThemeMode.dark:
        return 'Always use dark theme';
      case AppThemeMode.system:
        return 'Follow system settings';
    }
  }

  String _formatTime(String time24) {
    final parts = time24.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts[1];

    if (hour == 0) {
      return '12:$minute AM';
    } else if (hour < 12) {
      return '$hour:$minute AM';
    } else if (hour == 12) {
      return '12:$minute PM';
    } else {
      return '${hour - 12}:$minute PM';
    }
  }

  Future<void> _pickTime(
      BuildContext context,
      WidgetRef ref,
      String type,
      ) async {
    final prefs = ref.read(notificationPreferencesProvider);

    String currentTime;
    switch (type) {
      case 'morning':
        currentTime = prefs.morningReminderTime;
        break;
      case 'evening':
        currentTime = prefs.eveningReminderTime;
        break;
      case 'summary':
        currentTime = prefs.dailySummaryTime;
        break;
      default:
        currentTime = '08:00';
    }

    final parts = currentTime.split(':');
    final initialTime = TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final timeString =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';

      switch (type) {
        case 'morning':
          await ref
              .read(notificationPreferencesProvider.notifier)
              .setMorningReminderTime(timeString);
          break;
        case 'evening':
          await ref
              .read(notificationPreferencesProvider.notifier)
              .setEveningReminderTime(timeString);
          break;
        case 'summary':
          await ref
              .read(notificationPreferencesProvider.notifier)
              .setDailySummaryTime(timeString);
          break;
      }
    }
  }
}