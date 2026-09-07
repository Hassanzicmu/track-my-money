import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preferences.freezed.dart';
part 'notification_preferences.g.dart';

/// Notification preferences model
@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool enableMorningReminder,
    @Default('08:00') String morningReminderTime, // HH:mm format

    @Default(true) bool enableEveningReminder,
    @Default('19:00') String eveningReminderTime,

    @Default(true) bool enableDailySummary,
    @Default('21:30') String dailySummaryTime,

    @Default(true) bool enableBudgetAlerts,
    @Default(true) bool enableMonthlySummary,

    @Default(false) bool hasRequestedPermission,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}