// Route generator 

import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/forget_password/forget_password_screen.dart';
import 'package:flutter_task_12/src/views/login/login_screen.dart';
import 'package:flutter_task_12/src/views/main/main_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/bag/main_bag_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/favorites/main_favorites_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/home/main_home_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/shop/main_shop_screen.dart';
import 'package:flutter_task_12/src/views/settings/settings_screen.dart';
import 'package:flutter_task_12/src/views/signup/sign_up_screen.dart';
import '../../src/views/not_found/page_not_found.dart';

class RouteHandler {
   static Route<dynamic> generateRoutes (RouteSettings setting){
    switch(setting.name!){
      case SignUpScreen.route :  return MaterialPageRoute(builder: (context)=>const SignUpScreen());
      case LoginScreen.route :  return MaterialPageRoute(builder: (context)=> LoginScreen());
      case ForgetPasswordScreen.route :  return MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen());
      /* Main Screen */
      case MainScreen.route :  return MaterialPageRoute(builder: (context)=>const MainScreen());
        /* Subscreen of MainScreen*/
        case MainHomeScreen.route :  return MaterialPageRoute(builder: (context)=>const MainHomeScreen());
        case MainShopScreen.route :  return MaterialPageRoute(builder: (context)=>const MainShopScreen());
        case MainBagScreen.route :  return MaterialPageRoute(builder: (context)=>const MainBagScreen());
        case MainFavoritesScreen.route :  return MaterialPageRoute(builder: (context)=>const MainFavoritesScreen());
        /* End - Subscreen of MainScreen*/
      /* END - Main Screen */
      case SettingsScreen.route :  return MaterialPageRoute(builder: (context)=>const SettingsScreen());
      default : return MaterialPageRoute(builder: (_)=>const PageNotFound()); 
    }
  }
}
