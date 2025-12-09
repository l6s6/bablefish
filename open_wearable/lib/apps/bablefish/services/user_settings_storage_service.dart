import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_settings_model.dart';

class UserSettingsStorageService {
  static const _userSettingsKey = 'user_settings';

  // Save user settings
  Future<void> saveSettings(UserSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = json.encode(settings.toJson());
    await prefs.setString(_userSettingsKey, settingsJson);
  }

  // Load user settings
  Future<UserSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = prefs.getString(_userSettingsKey);
    if (settingsJson == null) {
      // Return default settings if nothing is saved yet
      return UserSettings.initial;
    }
    return UserSettings.fromJson(json.decode(settingsJson));
  }
}
