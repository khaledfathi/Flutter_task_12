import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/core_export.dart' ;
import 'package:flutter_task_12/src/models/user_model.dart'; 

class Auth {
  static UserModel  currentUser  = UserModel(); 

  static Future<bool> login ({required String email , required String password})async{
    bool isLogin = false; 
    Response response = await api.post(API_POST_LOGIN ,queryParameters: {
      'email':  email,
      'password': password
    }); 
    if (response.statusCode == 200 ) {
      if (response.data['error'] == null ){
        sharedPreferences.setBool(IS_LOGIN, true);
        sharedPreferences.setString(API_TOKEN, response.data['token']);
        sharedPreferences.setString(CURRENT_USER,  jsonEncode(response.data['user'])); 
        debugPrint('Auth : token recived = ${sharedPreferences.get(API_TOKEN)} [ok]');
        debugPrint('Auth : Shared Preference "IS_LOGIN" is ready [ok]');        
        debugPrint('Auth : Shared Preference "API_TOKEN" is ready [ok]');        
        debugPrint('Auth : Shared Preference "CURRENT_USER" is ready [ok]');        
        isLogin= true ; 
      }else{
        String error = response.data['error']; 
        debugPrint('Auth : login : $error [fail]');
      }
    }
    return isLogin; 
  }

  static void logout (){
        sharedPreferences.setBool(IS_LOGIN, false);
        sharedPreferences.remove(API_TOKEN);
        sharedPreferences.setString(CURRENT_USER,'[]'); 
        debugPrint('Auth : Shared Preference "API_TOKEN"  removed [ok]'); 
        debugPrint('Auth : Shared Preference "IS_LOGIN" set to false [ok]');        
        debugPrint('Auth : Shared Preference "CURRENT_USER" set to [] [ok]');
  }

  static void setCurrentUser (){
    Map userData =jsonDecode( sharedPreferences.getString(CURRENT_USER)??'') ; 
    if (userData.isNotEmpty){
      currentUser = UserModel.toMap(userData); 
      debugPrint('Auth : currentUser Model is ready [OK]'); 
    }else{
      throw ('Auth : currentUser : invalid map to create UserModel instance '); 
    }
  }
  
}