import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/headers/custom_header_text.dart';

class MainProfileScreenHeader extends StatelessWidget {
  const MainProfileScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomHeaderText(title: 'My Profile', margin: EdgeInsets.symmetric(vertical: 10),); 
  }
}