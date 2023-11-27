import 'package:flutter/material.dart';
import 'package:scanner/api_qr/login_screen.dart';
import 'package:scanner/api_service/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _rolNoController = TextEditingController();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool loading = false;

  Future<void> register(BuildContext context) async {
    try {
      setState(() {
        loading = true;
      });

     

      await ApiService().register(
          name: _nameController.text,
          email: _emailController.text,
          rollno: _rolNoController.text,
          password: _passwordController.text);
      

      if(context.mounted){

        Navigator.pop(context);
      }

    

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });

      if(context.mounted){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }

      
    }
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 25,
    );
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading ? const Center(child: CircularProgressIndicator(color: Colors.white),)  :Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white),
                hintText: 'Enter your Name',
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            sizedBox,
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _rolNoController,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your roll no',
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder),
            ),
            sizedBox,
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your Email',
                  border: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder),
            ),
            sizedBox,
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your password',
                  border: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white)),
                onPressed: () {
                  register(context);
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
