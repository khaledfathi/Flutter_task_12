import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/buttons/custom_standard_button.dart';

class LoginScreenLoginButton extends StatelessWidget {
  final void Function()? onPressed;
  const LoginScreenLoginButton({super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomStanderButton(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      text: 'LOGIN',
      onPressed: onPressed,
    );
  }
}
