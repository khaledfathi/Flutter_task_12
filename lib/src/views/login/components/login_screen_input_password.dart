import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/inputs/custom_text_form_field.dart';

class LoginScreenInputPassword extends StatelessWidget {
  final TextEditingController? controller  ; 
  final bool? obscureText ; 
  final Icon? suffixIcon; 
  final void Function (String)? onChanged; 
  final void Function (String?)? onSaved; 
  final String? Function (String?)? validator; 
  final IconData? suffixButtonIconData;
  final void Function ()?  onTapSuffixButton; 

  const LoginScreenInputPassword({super.key,
    this.controller,
    this.obscureText, 
    this.suffixIcon, 
    this.onChanged, 
    this.onSaved, 
    this.validator,
    this.suffixButtonIconData,
    this.onTapSuffixButton,
  });

  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      labelText: 'password',
      keyboardType: TextInputType.text,      
      obscureText: obscureText ??  true,
      suffixButtonIconData: suffixButtonIconData,
      onTapSuffixButton: onTapSuffixButton,
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      validator: validator,
    );
  }
}
