import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
   const QrScreen({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: QrImageView(
          data: data,
          version: QrVersions.auto,
          size: 300,
          gapless: false,
          backgroundColor: Colors.white,

          
        ),
      ),
    );
  }
}
