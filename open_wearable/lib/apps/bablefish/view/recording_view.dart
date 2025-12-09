import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_wearable/apps/bablefish/model/recording_model.dart';

class RecordingPage extends StatefulWidget {
  final Recording recording;

  const RecordingPage({super.key, required this.recording});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  double _currentTime = 0;

  @override
  Widget build(BuildContext context) {
    String currentTimeFormatted =
        Duration(seconds: _currentTime.toInt()).toString().split('.')[0];
    String durationFormatted =
        Duration(seconds: widget.recording.duration).toString().split('.')[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recording.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Handle settings tap
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              DateFormat("MMM dd, yyyy HH:mm").format(widget.recording.date),
              style: TextStyle(color: Colors.grey[600]),
            ),
            const Spacer(flex: 1),
            Slider(
              min: 0,
              max: widget.recording.duration.toDouble(),
              label: currentTimeFormatted,
              value: _currentTime,
              onChanged: (value) {
                setState(() {
                  _currentTime = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentTimeFormatted,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    durationFormatted,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const PlayIcons(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class PlayIcons extends StatelessWidget {
  const PlayIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.grey[800],
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.replay_10),
            ),
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.white,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ),
        SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.grey[800],
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.forward_10),
            ),
          ),
        ),
      ],
    );
  }
}
