// Placeholder for the Recording model.
class Recording {
  final String title;
  final String partnerName;
  final DateTime date;
  final bool isFavourite;
  final String transcript;
  final String audioFilePath;
  final int duration; //in seconds

  Recording({
    required this.title,
    required this.partnerName,
    required this.date,
    required this.isFavourite,
    required this.transcript,
    required this.audioFilePath,
    required this.duration,
  });

  // Factory-Method for creating model form JSON-Map (for shared_preferences)
  factory Recording.fromJson(Map<String, dynamic> json) {
    return Recording(
      title: json['title'],
      partnerName: json['partnerName'],
      date: DateTime.parse(json['date']),
      isFavourite: json['isFavourite'],
      transcript: json['transcript'],
      audioFilePath: json['audioFilePath'],
      duration: json['duration'],
    );
  }

  // Convert Model to JSON-Map (for shared_preferences)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'partnerName': partnerName,
      'date': date.toIso8601String(),
      'isFavourite': isFavourite,
      'transcript': transcript,
      'audioFilePath': audioFilePath,
      'duration': duration,
    };
  }
}
