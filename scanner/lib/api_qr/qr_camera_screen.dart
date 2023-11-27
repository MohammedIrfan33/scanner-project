import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanner/api_qr/profile_screen.dart';

class QrCameraScreen extends StatefulWidget {
  const QrCameraScreen({super.key});

  @override
  State<QrCameraScreen> createState() => _QrCameraScreenState();
}

class _QrCameraScreenState extends State<QrCameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          height: 300,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white,width: 3)
          ),
          child: MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
            
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(rollNo: barcode.rawValue!,),));
            },
          ),
        ),
      ),
    );
  }
}
