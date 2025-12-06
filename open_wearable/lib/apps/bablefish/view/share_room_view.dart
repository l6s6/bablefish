import 'package:flutter/material.dart';
import 'package:open_wearable/apps/bablefish/model/room.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareRoomPage extends StatelessWidget {
  final Room room;
  const ShareRoomPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Room'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            QrImageView(
              data: room.roomCode,
              version: QrVersions.auto,
              size: 250.0,
            ),
            SizedBox(height: 75),
            const Text('Room Code', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            Text(room.roomCode.toUpperCase(), style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
