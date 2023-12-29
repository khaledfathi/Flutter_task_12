// Route generator 

import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/forget_password/forget_password_screen.dart';
import 'package:flutter_task_12/src/views/login/login_screen.dart';
import 'package:flutter_task_12/src/views/main/main_screen.dart';
import 'package:flutter_task_12/src/views/signup/sign_up_screen.dart';
import '../../src/views/not_found/page_not_found.dart';

class RouteHandler {
   static Route<dynamic> generateRoutes (RouteSettings setting){
    switch(setting.name!){
      case SignUpScreen.route :  return MaterialPageRoute(builder: (context)=>const SignUpScreen());
      case LoginScreen.route :  return MaterialPageRoute(builder: (context)=> LoginScreen());
      case ForgetPasswordScreen.route :  return MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen());
      case MainScreen.route :  return MaterialPageRoute(builder: (context)=>const MainScreen());
      default : return MaterialPageRoute(builder: (_)=>const PageNotFound()); 
    }
  }
}
