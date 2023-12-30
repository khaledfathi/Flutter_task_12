import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/blocks/custom_social_media_block.dart';
import 'package:flutter_task_12/core/custom_widgets/buttons/custom_line_button.dart';
import 'package:flutter_task_12/core/custom_widgets/buttons/custom_standard_button.dart';
import 'package:flutter_task_12/core/custom_widgets/headers/custom_header_text.dart';
import 'package:flutter_task_12/core/custom_widgets/inputs/custom_text_form_field.dart';
import 'package:flutter_task_12/src/views/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = 'sign-up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            //headers
            const CustomHeaderText(title: 'Sign Up'),
            
            //inputs
            CustomTextFormField(labelText: 'Name'),
            CustomTextFormField(
              labelText: 'Email',
            ),
            CustomTextFormField(
              labelText: 'password',
            ),
            
            //already have an account line
            CustomLineButton(
              label: 'Already Have Account?',
              onPressed: () => Navigator.pushNamed(context, LoginScreen.route),
            ),
            
            //submit button
            CustomStanderButton(text: 'Sign Up' , onPressed: (){},),
            
            //social mediablock
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    child: CustomSocialMediaBlock(
                        text: 'Or sign up with social media account',
                        onTapGoogle: () {},
                        onTapFacebook: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
