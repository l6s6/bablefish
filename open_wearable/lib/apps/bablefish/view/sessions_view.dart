import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/view/conversation_view.dart';
import 'package:open_wearable/apps/bablefish/view/join_room_view.dart';
import 'package:open_wearable/apps/bablefish/view/settings_view.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bablefish'),
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
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 80,
            left: 10,
            right: 10,
            child: const Text(
              'Welcome to\nBablefish',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
            ),
          ),
          Positioned(
            bottom: 75,
            left: 125,
            right: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //TODO: create Session
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ConversationPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create Room',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => JoinRoomPage(),
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
                    'Join Room',
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
