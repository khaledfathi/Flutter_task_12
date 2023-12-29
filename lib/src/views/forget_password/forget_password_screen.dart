import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String route = 'forget-password'; 
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Forget Password Page'),),
    );
  }
}