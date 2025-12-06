import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_secondary.dart';

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
                SecondaryButton(onPressed: () {}, text: 'Share Room'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
