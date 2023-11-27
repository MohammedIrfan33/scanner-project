import 'package:flutter/material.dart';
import 'package:scanner/api_qr/home_screen.dart';
import 'package:scanner/qr_g_app/qr_scanner_screen.dart';
import 'package:scanner/qr_g_app/qr_screen.dart';

class QrGHScreen extends StatelessWidget {
   QrGHScreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              TextField(
                controller:  controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10) 
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {

        
                
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  QrScreen(data: controller.text,),));
                
              }, child: const Text('Generate')),
        
              Spacer(),
        
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50)
                ),
                
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => QrScannerScreen(),));

        
                
              }, child: const Text('Scan qr'),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        )
      ),
    );
  }
}