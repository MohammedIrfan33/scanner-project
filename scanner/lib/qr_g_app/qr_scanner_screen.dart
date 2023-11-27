import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(barcode.rawValue!)));
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
