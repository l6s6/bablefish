import 'package:open_wearable/apps/bablefish/model/languages.dart';

class UserSettings {
  final String username;
  final Languages language;
  final int ttsVolume;

  UserSettings({
    required this.username,
    required this.language,
    required this.ttsVolume,
  });

  // Factory-Method for creating model form JSON-Map (for shared_preferences)
  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      username: json['username'] as String,
      ttsVolume: json['ttsVolume'] as int,
      // Convert String back to Enum
      language: Languages.values.firstWhere(
        (e) => e.toString() == json['language'],
        orElse: () => Languages.english,
      ),
    );
  }

  // Convert Model to JSON-Map (for shared_preferences)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      // Convert Enum to String
      'language': language.toString(),
      'ttsVolume': ttsVolume,
    };
  }

  // Default values
  static UserSettings get initial => UserSettings(
        username: 'Anonymous',
        language: Languages.english,
        ttsVolume: 80,
      );
}
