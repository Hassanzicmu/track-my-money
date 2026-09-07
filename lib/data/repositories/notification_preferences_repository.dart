import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/notification_preferences.dart';

/// Repository for managing notification preferences
class NotificationPreferencesRepository {
  static const _key = 'notification_preferences';

  /// Load preferences
  Future<NotificationPreferences> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);

    if (json != null) {
      return NotificationPreferences.fromJson(jsonDecode(json));
    }

    return const NotificationPreferences();
  }

  /// Save preferences
  Future<void> savePreferences(
    NotificationPreferences preferences,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(preferences.toJson()));
  }

  /// Clear preferences
  Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
