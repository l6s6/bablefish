import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/recording_model.dart';

class RecordingStorageService {
  static const _recordingsListKey = 'recordings_list';

  // Save a list of recordings
  Future<void> saveRecordings(List<Recording> recordings) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recordingsJson =
        recordings.map((rec) => json.encode(rec.toJson())).toList();
    await prefs.setStringList(_recordingsListKey, recordingsJson);
  }

  // Load all recordings
  Future<List<Recording>> loadRecordings() async {
    final prefs = await SharedPreferences.getInstance();
    final recordingsJson = prefs.getStringList(_recordingsListKey);
    if (recordingsJson == null) {
      return [];
    }
    return recordingsJson
        .map((recJson) => Recording.fromJson(json.decode(recJson)))
        .toList();
  }

  // Add a single recording to the list
  Future<void> addRecording(Recording newRecording) async {
    List<Recording> recordings = await loadRecordings();
    // Remove old recording with same path if it exists, to avoid duplicates on update
    recordings
        .removeWhere((rec) => rec.audioFilePath == newRecording.audioFilePath);
    recordings.add(newRecording);
    await saveRecordings(recordings);
  }

  // Delete a recording from the list
  Future<void> deleteRecording(String audioFilePath) async {
    List<Recording> recordings = await loadRecordings();
    recordings.removeWhere((rec) => rec.audioFilePath == audioFilePath);
    await saveRecordings(recordings);
  }
}
