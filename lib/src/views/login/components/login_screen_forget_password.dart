import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/buttons/custom_line_button.dart';

class LoginScreenForgetPassword extends StatelessWidget {
  final void Function()? onPressed; 
  const LoginScreenForgetPassword({super.key, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLineButton(
      label: 'Forget your password?',
      onPressed: onPressed,
    );
  }
}
