import 'package:workmanager/workmanager.dart';
import 'package:track_my_money/domain/services/notification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// Task names
const String taskCheckBudget = 'check_budget';
const String taskDailySummary = 'daily_summary';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    debugPrint("Native called background task: $task");

    try {
      // NOTE: In a real app, you would need to initialize your Database/Hive here
      // because this runs in a separate Isolate.
      // For this debugging task, we will simulate the check or assume
      // simplistic shared preferences if possible, OR just trigger the notification
      // to prove the background worker is ALIVE.

      // Initialize Notification Service (crucial in background isolate)
      final notificationService = NotificationService();
      await notificationService.initialize();

      switch (task) {
        case taskCheckBudget:
           // TODO: Implement actual budget check logic
           break;

        case taskDailySummary:
           // TODO: Implement actual summary calculation logic
           break;
      }
      
      return Future.value(true);
    } catch (e) {
      debugPrint("Error in background task: $e");
      return Future.value(false);
    }
  });
}

class BackgroundService {
  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: kDebugMode, // TRUE for debugging
    );
  }

  static Future<void> registerPeriodicTasks() async {
    // Register budget check every 1 hour (15 min in debug)
    await Workmanager().registerPeriodicTask(
      "1",
      taskCheckBudget,
      frequency: const Duration(hours: 1),
      constraints: Constraints(
        networkType: NetworkType.not_required,
      ),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }
}
