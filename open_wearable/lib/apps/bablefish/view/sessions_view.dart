import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/room_model.dart';
import 'package:open_wearable/apps/bablefish/view/conversation_view.dart';
import 'package:open_wearable/apps/bablefish/view/join_room_view.dart';
import 'package:open_wearable/apps/bablefish/view/settings_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_primary.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_secondary.dart';
import 'package:open_wearable/apps/bablefish/view_model/bablefish_view_model.dart';
import 'package:provider/provider.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  final Room room = Room(roomCode: 'berlin');

  @override
  Widget build(BuildContext context) {
    final bablefishViewModel = Provider.of<BablefishViewModel>(context);
    String username = bablefishViewModel.userSettings.username;
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Text(
              'Welcome to\nBablefish',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
            ),
            Text('Hallo $username'),
            Spacer(
              flex: 2,
            ),
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
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
