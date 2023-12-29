import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/inputs/custom_text_form_field.dart';

class LoginScreenInputEmail extends StatelessWidget {
  final TextEditingController? controller ; 
  final void Function(String?)? onChanged; 
  final void Function(String?)? onSaved; 
  final String? Function(String?)? validator; 
  final Icon? suffixIcon ;
  final Color? suffixIconColor; 

  const LoginScreenInputEmail ({super.key,
    this.controller, 
    this.onChanged, 
    this.onSaved,
    this.validator,
    this.suffixIcon,
     this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            controller: controller,
            onChanged: onChanged,
            onSaved: onSaved,
            validator: validator,
          );
  }

}