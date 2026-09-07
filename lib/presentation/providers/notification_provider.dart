import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/notification_preferences_repository.dart';
import '../../domain/models/notification_preferences.dart';
import '../../domain/services/notification_service.dart';

/// Provider for notification preferences
final notificationPreferencesProvider =
    StateNotifierProvider<
      NotificationPreferencesNotifier,
      NotificationPreferences
    >((ref) => NotificationPreferencesNotifier());

/// Notifier for managing notification preferences
class NotificationPreferencesNotifier
    extends StateNotifier<NotificationPreferences> {
  final _repository = NotificationPreferencesRepository();
  final _notificationService = NotificationService();

  NotificationPreferencesNotifier()
    : super(const NotificationPreferences()) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    state = await _repository.loadPreferences();
    await _rescheduleNotifications();
  }

  /// Update preferences and reschedule notifications
  Future<void> updatePreferences(
    NotificationPreferences preferences,
  ) async {
    state = preferences;
    await _repository.savePreferences(preferences);
    await _rescheduleNotifications();
  }

  /// Toggle morning reminder
  Future<void> toggleMorningReminder(bool enabled) async {
    await updatePreferences(
      state.copyWith(enableMorningReminder: enabled),
    );
  }

  /// Set morning reminder time
  Future<void> setMorningReminderTime(String time) async {
    await updatePreferences(
      state.copyWith(morningReminderTime: time),
    );
  }

  /// Toggle evening reminder
  Future<void> toggleEveningReminder(bool enabled) async {
    await updatePreferences(
      state.copyWith(enableEveningReminder: enabled),
    );
  }

  /// Set evening reminder time
  Future<void> setEveningReminderTime(String time) async {
    await updatePreferences(
      state.copyWith(eveningReminderTime: time),
    );
  }

  /// Toggle daily summary
  Future<void> toggleDailySummary(bool enabled) async {
    await updatePreferences(
      state.copyWith(enableDailySummary: enabled),
    );
  }

  /// Set daily summary time
  Future<void> setDailySummaryTime(String time) async {
    await updatePreferences(state.copyWith(dailySummaryTime: time));
  }

  /// Toggle budget alerts
  Future<void> toggleBudgetAlerts(bool enabled) async {
    await updatePreferences(
      state.copyWith(enableBudgetAlerts: enabled),
    );
  }

  /// Toggle monthly summary
  Future<void> toggleMonthlySummary(bool enabled) async {
    await updatePreferences(
      state.copyWith(enableMonthlySummary: enabled),
    );
  }

  /// Mark permission as requested
  Future<void> markPermissionRequested() async {
    await updatePreferences(
      state.copyWith(hasRequestedPermission: true),
    );
  }

  /// Request notification permissions
  Future<bool> requestPermissions() async {
    final granted = await _notificationService.requestPermissions();
    if (granted) {
      await markPermissionRequested();
      await _rescheduleNotifications();
    }
    return granted;
  }

  /// Reschedule all notifications based on current preferences
  Future<void> _rescheduleNotifications() async {
    await _notificationService.cancelAllNotifications();

    // Schedule morning reminder
    if (state.enableMorningReminder) {
      final time = _parseTime(state.morningReminderTime);
      await _notificationService.scheduleMorningReminder(time);
    }

    // Schedule evening reminder
    if (state.enableEveningReminder) {
      final time = _parseTime(state.eveningReminderTime);
      await _notificationService.scheduleEveningReminder(time);
    }

    // Schedule daily summary
    if (state.enableDailySummary) {
      final time = _parseTime(state.dailySummaryTime);
      await _notificationService.scheduleDailySummary(time);
    }
  }

  /// Parse time string (HH:mm) to TimeOfDay
  TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}
