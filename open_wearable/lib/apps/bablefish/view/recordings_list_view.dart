import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/recording.dart';
import 'package:open_wearable/apps/bablefish/view/settings_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/recording_tile.dart';

class RecordingsListPage extends StatefulWidget {
  const RecordingsListPage({super.key});

  @override
  State<RecordingsListPage> createState() => _RecordingsListPageState();
}

class _RecordingsListPageState extends State<RecordingsListPage> {
  final List<Recording> _recordings = [
    Recording(
      title: "Talk with Jan",
      date: DateTime(2025, 12, 05, 12, 14),
      isFavourite: true,
    ),
    Recording(
      title: "Talk with Lukas",
      date: DateTime(2023, 12, 06, 13, 10),
      isFavourite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
        child: ListView.builder(
          itemCount: _recordings.length,
          itemBuilder: (context, index) {
            return RecordingTile(recording: _recordings[index]);
          },
        ),
      ),
    );
  }
}
