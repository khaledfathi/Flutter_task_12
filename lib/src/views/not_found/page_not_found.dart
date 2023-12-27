import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  static const String route = 'page-not-found'; 
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('page not found'),),
    ); 
  }
}