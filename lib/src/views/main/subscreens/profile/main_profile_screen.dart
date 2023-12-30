import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/main/subscreens/profile/components/main_profile_screen_header.dart';
import 'package:flutter_task_12/src/views/main/subscreens/profile/components/main_profile_screen_options.dart';
import 'package:flutter_task_12/src/views/main/subscreens/profile/components/main_profile_screen_user_data.dart';

class MainProfileScreen extends StatelessWidget {
  static const String route = 'main/profile';
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
       scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, size: 24)),
        ],
      ),
      body: const Column(
        children: [
          //header
          MainProfileScreenHeader(),
          //user data
          MainProfileScreenUserData(), 
          //profile options list
          Expanded(
            child:  MainProfileScreenOptions(), 
          ),
        ],
      ),
    );
  }
}
