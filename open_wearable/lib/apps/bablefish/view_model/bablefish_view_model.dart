import 'package:flutter/foundation.dart';
import 'package:open_wearable/apps/bablefish/model/user_settings_model.dart';
import 'package:open_wearable/apps/bablefish/services/user_settings_storage_service.dart';

class BablefishViewModel extends ChangeNotifier {
  final UserSettingsStorageService _storageService;
  late UserSettings _userSettings;

  BablefishViewModel(this._userSettings)
      : _storageService = UserSettingsStorageService();

  UserSettings get userSettings => _userSettings;

  Future<void> loadSettings() async {
    _userSettings = await _storageService.loadSettings();
    notifyListeners();
  }

  Future<void> updateSettings(UserSettings newSettings) async {
    _userSettings = newSettings;
    await _storageService.saveSettings(newSettings);
    notifyListeners();
  }
}
