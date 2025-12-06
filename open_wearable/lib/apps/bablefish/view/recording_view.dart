import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/recording_tile.dart';

class RecordingPage extends StatelessWidget {
  final Recording recording;

  const RecordingPage({super.key, required this.recording});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recording.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Handle settings tap
            },
          ),
        ],
      ),
    );
  }
}
