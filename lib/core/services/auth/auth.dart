import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/constants/api_const.dart';
import 'package:flutter_task_12/core/constants/general_const.dart';

import '../../globals/globals.dart' as globals;
class Auth {
  Future<bool> login ({required String email , required String password})async{
    bool isLogin = false; 
    Response response = await globals.api.post(API_POST_LOGIN ,queryParameters: {
      'email':  email,
      'password': password
    }); 
    if (response.statusCode == 200 ) {
      if (response.data != ''){
        globals.sharedPreferences.setBool(IS_LOGIN, true);
        globals.sharedPreferences.setString(API_TOKEN, response.data['token']);
        debugPrint('Auth : token recived = ${globals.sharedPreferences.get(API_TOKEN)} [ok]');
        debugPrint('Auth : user is logedin , "API_TOKEN" is ready [ok]');
        isLogin= true ; 
      }else{
        debugPrint('Auth : response is ok ,but there\'s no data [fail]');
      }
    }
    return isLogin; 
  }
}