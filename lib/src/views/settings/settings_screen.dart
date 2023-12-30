import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = 'main/profile/settings'; 
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Settings screen'),),
    );
  }
}