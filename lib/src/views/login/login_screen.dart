import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/states/login_screen_states/login_screen_login_state.dart';
import 'package:flutter_task_12/core/states/login_screen_states/login_screen_password_state.dart';
import 'package:flutter_task_12/core/services/validation/validation.dart';
import 'package:flutter_task_12/src/controllers/login/login_controller.dart';
import 'package:flutter_task_12/src/views/forget_password/forget_password_screen.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_forget_password.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_header.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_input_email.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_input_password.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_login_button.dart';
import 'package:flutter_task_12/src/views/login/components/login_screen_social_media_block.dart';
import 'package:flutter_task_12/src/views/main/main_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';
  //screen controller
  final LoginController controller = LoginController();
  //keys
  final GlobalKey<FormState> formKey = GlobalKey();
  //inputs controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => LoginScreenPasswordState()),
          ChangeNotifierProvider(create: (context) => LoginScreenLoginState()),
        ],
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              //title
              const LoginScreenHeader(),

              //inputs
              LoginScreenInputEmail(
                controller: emailController,
                validator: (email) => emailValidation(email!),
              ),
              Consumer<LoginScreenPasswordState>(
                  builder: (context, state, child) {
                return LoginScreenInputPassword(
                  controller: passwordController,
                  validator: (password) => passwordValidation(password!),
                  obscureText: state.passwordHide,
                  suffixButtonIconData: state.passwordVisibilityIcon,
                  onTapSuffixButton: () => state.passwordVisibilityToggle(),
                );
              }),

              //forget password button
              LoginScreenForgetPassword(
                onPressed: () =>
                    Navigator.pushNamed(context, ForgetPasswordScreen.route),
              ),

              //login button
              Consumer<LoginScreenLoginState>(builder: (context, state, child) {
                return LoginScreenLoginButton(onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    state.changeToLoginValid();
                    state.changeToLoading();
                    await controller
                        .login(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text)
                        .then((isLogin) {
                      if (isLogin) {
                        state.changeToNotLoading();
                        Navigator.pushNamed(context, MainScreen.route);
                      } else {
                        state.changeToNotLoading();
                        state.changeToLoginInvalid();
                      }
                    });
                  }
                });
              }),
              //lodaing sign
              Consumer<LoginScreenLoginState>(builder: (context, state, child) {
                return SizedBox(
                  child:
                      state.loading ? const CircularProgressIndicator() : null,
                );
              }),
              Consumer<LoginScreenLoginState>(builder: (context, state, child) {
                return SizedBox(
                  child:
                      state.loginCase != null ? Text(state.loginCase!) : null,
                );
              }),

              //social media box
              LoginScreenSocialMediaBlock(
                onTapFacebook: () {},
                onTapGoogle: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? passwordValidation(String password) {
    Validation valid = Validation(password, fieldName: 'password').length(minLength: 3).required().validate();
    if (!valid.isValid) {
      return valid.errors.first;
    }
    return null;
  }
  String? emailValidation(String email) {
    Validation valid = Validation(email, fieldName: 'Email').email().required().validate();
    if (!valid.isValid) {
      return valid.errors.first;
    }
    return null;
  }
}
