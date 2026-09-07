import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Notification channel IDs
enum NotificationChannel {
  reminders,
  budgetAlerts,
  summaries;

  String get id {
    switch (this) {
      case NotificationChannel.reminders:
        return 'reminders';
      case NotificationChannel.budgetAlerts:
        return 'budget_alerts';
      case NotificationChannel.summaries:
        return 'summaries';
    }
  }

  String get name {
    switch (this) {
      case NotificationChannel.reminders:
        return 'Daily Reminders';
      case NotificationChannel.budgetAlerts:
        return 'Budget Alerts';
      case NotificationChannel.summaries:
        return 'Summaries';
    }
  }

  String get description {
    switch (this) {
      case NotificationChannel.reminders:
        return 'Morning and evening reminders';
      case NotificationChannel.budgetAlerts:
        return 'Budget threshold alerts';
      case NotificationChannel.summaries:
        return 'Daily and monthly summaries';
    }
  }
}

/// Notification types for scheduling
enum NotificationType {
  morningReminder(1),
  eveningReminder(2),
  dailySummary(3),
  monthlySummary(4),
  budgetAlert(5);

  final int id;

  const NotificationType(this.id);
}

/// Singleton service for handling all notifications
class NotificationService {
  static final NotificationService _instance =
      NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  /// Initialize notification service
  Future<void> initialize() async {
    if (_initialized) return;

    // Initialize timezone database
    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation('Asia/Kolkata'),
    ); // Indian timezone

    // Android initialization settings
    const androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
    );

    // iOS initialization settings (for future)
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channels
    await _createNotificationChannels();

    _initialized = true;
  }

  /// Create notification channels for Android
  Future<void> _createNotificationChannels() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      // Reminders channel
      await androidPlugin.createNotificationChannel(
        AndroidNotificationChannel(
          NotificationChannel.reminders.id,
          NotificationChannel.reminders.name,
          description: NotificationChannel.reminders.description,
          importance: Importance.high,
          playSound: true,
          enableVibration: true,
        ),
      );

      // Budget alerts channel
      await androidPlugin.createNotificationChannel(
        AndroidNotificationChannel(
          NotificationChannel.budgetAlerts.id,
          NotificationChannel.budgetAlerts.name,
          description: NotificationChannel.budgetAlerts.description,
          importance: Importance.high,
          playSound: true,
          enableVibration: true,
        ),
      );

      // Summaries channel
      await androidPlugin.createNotificationChannel(
        AndroidNotificationChannel(
          NotificationChannel.summaries.id,
          NotificationChannel.summaries.name,
          description: NotificationChannel.summaries.description,
          importance: Importance.defaultImportance,
          playSound: true,
        ),
      );
    }
  }

  /// Request notification permissions (Android 13+)
  Future<bool> requestPermissions() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      // Use standard notifications permission
      final granted = await androidPlugin.requestNotificationsPermission();
      
      return granted ?? false;
    }

    return true; // Assume granted for older Android versions
  }

  /// Check if permissions are granted
  Future<bool> areNotificationsEnabled() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      final result = await androidPlugin.areNotificationsEnabled();
      return result ?? false;
    }

    return true;
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    debugPrint('Notification tapped: ${response.payload}');
    // TODO: Navigate to specific screen based on payload
  }

  /// Show immediate notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required NotificationChannel channel,
    String? payload,
  }) async {
    await _notifications.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel == NotificationChannel.budgetAlerts
              ? Importance.high
              : Importance.defaultImportance,
          priority: channel == NotificationChannel.budgetAlerts
              ? Priority.high
              : Priority.defaultPriority,
          icon: '@drawable/splash_icon',
        ),
      ),
      payload: payload,
    );
  }

  /// Schedule daily notification at specific time
  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
    required NotificationChannel channel,
    String? payload,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // If time has passed today, schedule for tomorrow
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@drawable/splash_icon',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  /// Cancel specific notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>>
  getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Schedule morning reminder
  Future<void> scheduleMorningReminder(TimeOfDay time) async {
    final messages = [
      "Good morning ☀️ Ready to track today's spending?",
      "New day, fresh start! Log your expenses 📊",
      "A few seconds today = peace of mind tomorrow 💰",
      "Quick check-in: Stay on top of your finances today 💪",
    ];

    final randomMessage =
        messages[DateTime.now().millisecond % messages.length];

    await scheduleDailyNotification(
      id: NotificationType.morningReminder.id,
      title: 'Good Morning! ☀️',
      body: randomMessage,
      time: time,
      channel: NotificationChannel.reminders,
      payload: 'morning_reminder',
    );
  }

  /// Schedule evening reminder
  Future<void> scheduleEveningReminder(TimeOfDay time) async {
    await scheduleDailyNotification(
      id: NotificationType.eveningReminder.id,
      title: 'Quick Check-in 📝',
      body: 'Any expenses today? Takes just 10 seconds 🙂',
      time: time,
      channel: NotificationChannel.reminders,
      payload: 'evening_reminder',
    );
  }

  /// Schedule daily summary
  Future<void> scheduleDailySummary(TimeOfDay time) async {
    await scheduleDailyNotification(
      id: NotificationType.dailySummary.id,
      title: 'Daily Summary 📊',
      body: 'Tap to see today\'s spending summary',
      time: time,
      channel: NotificationChannel.summaries,
      payload: 'daily_summary',
    );
  }

  /// Show budget alert
  Future<void> showBudgetAlert({
    required String category,
    required double spent,
    required double budget,
    required double percentage,
  }) async {
    String title;
    String body;

    if (percentage >= 100) {
      title = '🚨 Budget Exceeded';
      body =
          '$category: ₹${spent.toStringAsFixed(0)}/₹${budget.toStringAsFixed(0)} (${percentage.toStringAsFixed(0)}%)';
    } else if (percentage >= 90) {
      title = '⚠️ Budget Alert';
      body =
          '$category budget at ${percentage.toStringAsFixed(0)}%. ₹${(budget - spent).toStringAsFixed(0)} left';
    } else if (percentage >= 80) {
      title = '📊 Budget Update';
      body =
          '$category at ${percentage.toStringAsFixed(0)}%. You\'re doing great! 👍';
    } else {
      return; // Don't show notification below 80%
    }

    await showNotification(
      id: NotificationType.budgetAlert.id + category.hashCode,
      title: title,
      body: body,
      channel: NotificationChannel.budgetAlerts,
      payload: 'budget_alert:$category',
    );
  }

  /// Show daily summary notification
  Future<void> showDailySummaryNotification({
    required double totalSpent,
    required String topCategory,
    required double topCategoryAmount,
  }) async {
    final body = totalSpent > 0
        ? 'Today: ₹${totalSpent.toStringAsFixed(0)} • Top: $topCategory (₹${topCategoryAmount.toStringAsFixed(0)}) 📊'
        : 'No expenses logged today. Great savings day! 💰';

    await showNotification(
      id: NotificationType.dailySummary.id,
      title: 'Daily Summary 📊',
      body: body,
      channel: NotificationChannel.summaries,
      payload: 'daily_summary_result',
    );
  }

  /// Show monthly summary notification
  Future<void> showMonthlySummaryNotification({
    required String month,
    required double income,
    required double expense,
    required double savings,
  }) async {
    final emoji = savings > 0
        ? '🎉'
        : savings == 0
        ? '😊'
        : '📊';

    final body =
        '''$month Summary:
Income: ₹${income.toStringAsFixed(0)}
Expenses: ₹${expense.toStringAsFixed(0)}
${savings > 0
            ? 'Saved'
            : savings < 0
            ? 'Deficit'
            : 'Balanced'}: ₹${savings.abs().toStringAsFixed(0)} $emoji''';

    await showNotification(
      id: NotificationType.monthlySummary.id,
      title: '📊 Monthly Summary',
      body: body,
      channel: NotificationChannel.summaries,
      payload: 'monthly_summary',
    );
  }
}
