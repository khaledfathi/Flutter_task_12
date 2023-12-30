import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_12/core/custom_widgets/headers/custom_header_text.dart';
import 'package:flutter_task_12/src/controllers/login/cubit/email_validate_sign_cubit.dart';
import 'package:flutter_task_12/src/controllers/login/cubit/login_cubit.dart';
import 'package:flutter_task_12/src/controllers/login/cubit/password_visibility_cubit.dart';
import 'package:flutter_task_12/src/views/forget_password/forget_password_screen.dart';
//core
import 'package:flutter_task_12/core/core_export.dart';
//screen components
import 'package:flutter_task_12/src/views/login/components/login_screen_components_export.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';
  //controllers
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => EmailValidateSignCubit(),),
          BlocProvider(create: (context) => PasswordVisibilityCubit(),),
        ],
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //title
              const CustomHeaderText(title: 'Login',),

              //inputs
              //email
              BlocConsumer<EmailValidateSignCubit , EmailValidateSignState>(
                  builder: (context, state) {
                    return LoginScreenInputEmail(
                      controller: emailController,
                      validator: (email) => emailValidation(email!),
                      suffixIcon: state is EmailValid ? const Icon(Icons.check) : null, 
                      suffixIconColor: state is EmailValid ? Colors.green : Colors.red, 
                      onChanged: (email)=> EmailValidateSignCubit.get(context).checkEmail(email!),
                    );
                  },
                  listener: (context, state) {}),

              //password
              BlocConsumer<PasswordVisibilityCubit, PasswordVisibilityState>(
                  builder: (context, state) {
                    PasswordVisibilityCubit cubit =
                        PasswordVisibilityCubit.get(context);
                    return LoginScreenInputPassword(
                      controller: passwordController,
                      validator: (password) => passwordValidation(password!),
                      obscureText: cubit.hidePassword,
                      suffixButtonIconData: cubit.hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTapSuffixButton: () => cubit.passwordVisibaleToggle(),
                    );
                  },
                  listener: (context, state) {}),

              //forget password button
              LoginScreenForgetPassword(
                onPressed: () =>
                    Navigator.pushNamed(context, ForgetPasswordScreen.route),
              ),

              //login button
              BlocConsumer<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return LoginScreenLoginButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).login(context,
                            emailController.text, passwordController.text);
                      }
                    });
                  },
                  listener: (context, state) {}),

              // lodaing sign
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text(
                        BlocProvider.of<LoginCubit>(context).loginErrorMessage);
                  }
                },
              ),

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
    Validation valid = Validation(password, fieldName: 'password')
        .length(minLength: 3)
        .required()
        .validate();
    if (!valid.isValid) {
      return valid.errors.first;
    }
    return null;
  }

  String? emailValidation(String email) {
    Validation valid =
        Validation(email, fieldName: 'Email').email().required().validate();
    if (!valid.isValid) {
      return valid.errors.first;
    }
    return null;
  }
}
