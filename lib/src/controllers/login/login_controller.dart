import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/services/auth/auth.dart';

class LoginController {
  
  Future<bool >  login ({required BuildContext context , required String email , required String password})async{
    return await Auth().login(email: email , password: password); 
  }
}