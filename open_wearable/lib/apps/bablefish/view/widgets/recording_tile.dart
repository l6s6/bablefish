import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';
import 'package:open_wearable/apps/bablefish/model/recording_model.dart';
import 'package:open_wearable/apps/bablefish/view/recording_view.dart';

class RecordingTile extends StatelessWidget {
  final Recording recording;

  const RecordingTile({super.key, required this.recording});

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      title: Text(recording.title),
      subtitle: Text(
        DateFormat("MMM dd, yyyy HH:mm").format(recording.date),
        style: TextStyle(color: Colors.grey[600]),
      ),
      leading: const Icon(Icons.mic),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (recording.isFavourite) const Icon(Icons.star),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => {},
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => RecordingPage(recording: recording),
          ),
        );
      },
    );
  }
}
