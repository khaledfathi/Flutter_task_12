import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_12/src/views/main/main_screen.dart';
import 'package:meta/meta.dart';
import 'package:flutter_task_12/core/core_export.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()); 

  //cubit access  
  static LoginCubit get(context) => BlocProvider.of(context); 

  //values 
  String loginErrorMessage = ''; 

  Future<void> login(context , String email , String password) async{
    emit(LoginLoading()); 
    await Auth.login(email: email, password: password).then((isLogin){
      if (isLogin){
        emit(LoginSuccess());        
        loginErrorMessage = '' ; 
        Auth.setCurrentUser(); 
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.route ,(route)=>false ); 
      } else {
        loginErrorMessage = 'Invalid user name or password' ; 
        emit(LoginFail());
      }
    }); 
    debugPrint('LoginCubit : state changed to "${state.runtimeType}" [OK]'); 
  }
}
