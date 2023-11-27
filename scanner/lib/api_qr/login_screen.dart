import 'package:flutter/material.dart';
import 'package:scanner/api_qr/home_screen.dart';
import 'package:scanner/api_qr/register_screen.dart';
import 'package:scanner/api_service/api_service.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _rolNoController = TextEditingController();
  final _passwordController = TextEditingController();

  bool loading = false;


  Future<void> login() async{
    try{

      setState(() {
        loading = true;
      });

      String dbrolno = await ApiService().login(rollNo:  _rolNoController.text, password: _passwordController.text);
 
      if(context.mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen(rollNo: dbrolno),));
      }

      setState(() {
        loading =false;
      });


    }catch(e){

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));




    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:loading ? Center(child: CircularProgressIndicator(),)  :Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Text('Login',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
           

           SizedBox(height: 40,),
           
            TextField(
              controller:  _rolNoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your Roll no',
                hintStyle: const TextStyle(color: Colors.white),
                
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
              ),
            ),
            SizedBox(height: 20,),
             TextField(
              controller:  _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(10) 
                ),
              ),
            ),
            const SizedBox(height: 20,),
            OutlinedButton(

              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white)
              ),
              
              onPressed: () {

                login();

      
              
              
            }, child: const Text('Login',style: TextStyle(color: Colors.white),)),
      
            const SizedBox(height: 30,),
      
            TextButton(onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
      
              
            }, child: const Text('dont have accout?register',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}