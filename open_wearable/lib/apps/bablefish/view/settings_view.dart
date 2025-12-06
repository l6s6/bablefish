import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_primary.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
                PrimaryButton(onPressed: () {}, text: 'Save'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
