import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/room.dart';
import 'package:open_wearable/apps/bablefish/view/share_room_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_secondary.dart';

class ConversationPage extends StatefulWidget {
  final Room room;
  const ConversationPage({super.key, required this.room});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation'),
        actions: [
          IconButton(
            onPressed: () => {
              //TODO: leave conversation
            },
            icon: const Icon(Icons.call_end),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(child: Text('Joined Room: ${widget.room.roomCode}', style: TextStyle(fontSize: 30),),),

          Positioned(
            bottom: 125,
            left: 125,
            right: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SecondaryButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => ShareRoomPage(room: widget.room),
                    ),
                  );
                }, text: 'Share Room',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
