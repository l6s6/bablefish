import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:open_wearable/apps/bablefish/model/room.dart';
import 'package:open_wearable/apps/bablefish/view/conversation_view.dart';
import 'package:open_wearable/apps/bablefish/view/widgets/button_primary.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({super.key});

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  final TextEditingController _manualController = TextEditingController();
  MobileScannerController cameraController = MobileScannerController();
  String? scannedCode;
  bool isScanning = true;

  @override
  void dispose() {
    _manualController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  void _onCodeDetected(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty && isScanning) {
      final String? code = barcodes.first.rawValue;
      if (code != null) {
        setState(() {
          scannedCode = code;
          isScanning = false;
        });
        _processCode(code);
      }
    }
  }

  void _processCode(String code) {
    // TODO Join Room
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(
        builder: (context) => ConversationPage(
          room: Room(roomCode: code),
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  void _submitManualCode() {
    final code = _manualController.text.trim();
    if (code.isNotEmpty) {
      setState(() {
        scannedCode = code;
      });
      _processCode(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Room'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Scanner-Fenster
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MobileScanner(
                  controller: cameraController,
                  onDetect: _onCodeDetected,
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Input room code manually:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _manualController,
              decoration: InputDecoration(
                hintText: 'Enter code here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _manualController.clear(),
                ),
              ),
            ),
            const SizedBox(height: 25),
            PrimaryButton(
                onPressed: () {
                  _submitManualCode();
                },
                text: 'Join Room')
          ],
        ),
      ),
    );
  }
}
