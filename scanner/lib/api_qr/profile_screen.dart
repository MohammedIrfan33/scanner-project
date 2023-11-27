import 'package:flutter/material.dart';
import 'package:scanner/api_qr/login_screen.dart';
import 'package:scanner/api_service/api_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ required this.rollNo});


  final String rollNo;

  Future<dynamic> getData() async{
    try{
        return  await ApiService().getDatafromQr(rollNo);

    }catch(e){

      return Future.error(e);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          
        }, icon: const Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      body: FutureBuilder(
        future:  getData(),
        builder: (context, snapshot) {

          if(snapshot.hasData){

            var data = snapshot.data;


            return Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
              Text(data['name'],style: const TextStyle(
                color: Colors.white,
                fontSize: 20
      
              ),),
              const Text('Flutter Developer',style: TextStyle(color: Colors.white,letterSpacing: 1.5,),),
              const Divider(
                height: 20,
                thickness: 2,
                color: Colors.white,
                indent: 40,
                endIndent: 40,
              ),
               Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.email),
                    Text(data['email']),
                    
                  ],
                ),
              ),
              const SizedBox(height:20 ,),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.numbers),
                    Text(data['rollno']),
                    
                  ],
                ),
              )

            ],
          ),
        ),
      );
    
    



          }else if(snapshot.hasError){

            return Center(child: Text(snapshot.error.toString(),style:const  TextStyle(color: Colors.white),));


          }

          return  const Center(child: CircularProgressIndicator(color: Colors.white),);
          
        },
      )
    );
  }
}