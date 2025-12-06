import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/room.dart';
import 'package:open_wearable/apps/bablefish/view/conversation_view.dart';
import 'package:open_wearable/apps/bablefish/view/join_room_view.dart';
import 'package:open_wearable/apps/bablefish/view/settings_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_primary.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_secondary.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  final Room room = Room(roomCode: 'berlin');

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
                PrimaryButton(
                  onPressed: () {
                    //TODO: create Session
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ConversationPage(
                          room: room,
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  text: 'Create Room',
                ),
                const SizedBox(height: 30),
                SecondaryButton(
                  onPressed: () {
                    //TODO: create Session
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => JoinRoomPage(),
                      ),
                    );
                  },
                  text: 'Join Room',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
