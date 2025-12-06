import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';
import 'package:open_wearable/apps/bablefish/view/recording_view.dart';

// Placeholder for the Recording model.
// This can be moved to its own file and fleshed out later.
class Recording {
  final String title;
  final DateTime date;
  final bool isFavourite;

  Recording({
    required this.title,
    required this.date,
    required this.isFavourite,
  });
}

class RecordingTile extends StatelessWidget {
  final Recording recording;

  const RecordingTile({super.key, required this.recording});

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      title: PlatformText(recording.title),
      subtitle:
          PlatformText(DateFormat("MMM dd, yyyy HH:mm").format(recording.date)),
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
