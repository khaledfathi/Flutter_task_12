// Route generator 

import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/splash/splash_screen.dart';
import '../../src/views/not_found/page_not_found.dart';

class RouteHandler {
   static Route<dynamic> generateRoutes (RouteSettings setting){
    switch(setting.name!){
      case SplashScreen.route : return MaterialPageRoute(builder: (context)=>const SplashScreen());
      default : return MaterialPageRoute(builder: (_)=>const PageNotFound()); 
    }
  }
}
