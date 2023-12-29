import 'package:flutter/material.dart';

class LoginScreenLoginState extends ChangeNotifier{
  bool loading = false ; 
  String? loginCase ; 

  void changeToLoading() {
    loading = true ; 
    notifyListeners(); 
  }
  void changeToNotLoading (){
     loading = false ; 
    notifyListeners(); 
  }
  
  //
  void changeToLoginInvalid (){
    loginCase = 'Invalid Email or password '; 
    notifyListeners(); 
  }
  void changeToLoginValid (){
    loginCase = null; 
    notifyListeners(); 
  }

}