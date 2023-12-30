import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_12/core/core_export.dart';
import 'package:meta/meta.dart';

part 'email_validate_sign_state.dart';

class EmailValidateSignCubit extends Cubit<EmailValidateSignState> {
  EmailValidateSignCubit() : super(EmailValidateSignInitial());

  static EmailValidateSignCubit get(context)=> BlocProvider.of(context); 

  void checkEmail (String email){
    if (Validation(email, fieldName: 'email').email().required().validate().isValid){      
      emit(EmailValid()); 
    }else{
      emit(EmailInvalid()); 
    }
  } 
}
