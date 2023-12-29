import 'package:flutter/material.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
