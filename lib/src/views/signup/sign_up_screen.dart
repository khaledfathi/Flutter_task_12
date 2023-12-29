import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = 'sign-up'; 
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('SIGNUP' , style: Theme.of(context).textTheme.titleLarge,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, LoginScreen.route);
          }, child: const Text('To Login')),
        ],
      ),
    );
  }
}