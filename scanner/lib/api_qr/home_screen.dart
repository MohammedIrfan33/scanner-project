import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner/api_qr/qr_camera_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.rollNo});

  final String rollNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.white,
            ),
            const Spacer(),
            QrImageView(
              data: rollNo,
              version: QrVersions.auto,
              size: 200,
              gapless: false,
              backgroundColor: Colors.white,

              
            ),
            const Spacer(),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QrCameraScreen(),),);
                },
                child: const Text(
                  'Scan',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
