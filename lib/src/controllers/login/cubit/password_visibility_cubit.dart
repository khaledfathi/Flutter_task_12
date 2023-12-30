import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());

  static PasswordVisibilityCubit  get(context)=> BlocProvider.of(context); 

  bool hidePassword = true; 
  void passwordVisibaleToggle(){
    hidePassword = !hidePassword; 
    emit(PasswordToggle()); 
    debugPrint('PasswordVisibilityCubit : visibility change to $hidePassword [OK]');
  }
}
