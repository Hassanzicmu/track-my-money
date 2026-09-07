// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationPreferencesImpl _$$NotificationPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationPreferencesImpl(
      enableMorningReminder: json['enableMorningReminder'] as bool? ?? true,
      morningReminderTime: json['morningReminderTime'] as String? ?? '08:00',
      enableEveningReminder: json['enableEveningReminder'] as bool? ?? true,
      eveningReminderTime: json['eveningReminderTime'] as String? ?? '19:00',
      enableDailySummary: json['enableDailySummary'] as bool? ?? true,
      dailySummaryTime: json['dailySummaryTime'] as String? ?? '21:30',
      enableBudgetAlerts: json['enableBudgetAlerts'] as bool? ?? true,
      enableMonthlySummary: json['enableMonthlySummary'] as bool? ?? true,
      hasRequestedPermission: json['hasRequestedPermission'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationPreferencesImplToJson(
        _$NotificationPreferencesImpl instance) =>
    <String, dynamic>{
      'enableMorningReminder': instance.enableMorningReminder,
      'morningReminderTime': instance.morningReminderTime,
      'enableEveningReminder': instance.enableEveningReminder,
      'eveningReminderTime': instance.eveningReminderTime,
      'enableDailySummary': instance.enableDailySummary,
      'dailySummaryTime': instance.dailySummaryTime,
      'enableBudgetAlerts': instance.enableBudgetAlerts,
      'enableMonthlySummary': instance.enableMonthlySummary,
      'hasRequestedPermission': instance.hasRequestedPermission,
    };
