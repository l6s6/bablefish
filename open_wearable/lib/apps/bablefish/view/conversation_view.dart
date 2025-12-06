import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/view/share_room_view.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

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
          Positioned(
            bottom: 125,
            left: 125,
            right: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ShareRoomPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Share Room',
                    style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
