import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/languages.dart';
import 'package:open_wearable/apps/bablefish/model/room_model.dart';
import 'package:open_wearable/apps/bablefish/view/bablefish_view.dart';
import 'package:open_wearable/apps/bablefish/view/share_room_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_secondary.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/leave_room_dialog.dart';
import 'package:open_wearable/apps/bablefish/view_model/bablefish_view_model.dart';
import 'package:open_wearable/widgets/home_page.dart';
import 'package:provider/provider.dart';

class ConversationPage extends StatefulWidget {
  final Room room;
  const ConversationPage({super.key, required this.room});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    final bablefishViewModel = Provider.of<BablefishViewModel>(context);
    String username = bablefishViewModel.userSettings.username;
    Languages language = bablefishViewModel.userSettings.language;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation'),
        actions: [
          IconButton(
            onPressed: () async {
              final bool? confirmed = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) => const LeaveRoomDialog(),
              );
              if (confirmed == true) {
                // Push to APps page first to restore stack
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const HomePage(),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const BablefishView(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.call_end),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            Spacer(flex: 1),
            Text(
              'User: $username',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Language: ${language.toString()}',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 25),
            Text(
              'Joined Room: ${widget.room.roomCode}',
              style: TextStyle(fontSize: 30),
            ),
            Spacer(flex: 1),
            SecondaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => ShareRoomPage(room: widget.room),
                  ),
                );
              },
              text: 'Share Room',
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
