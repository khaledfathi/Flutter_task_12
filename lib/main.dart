import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/main/main_screen.dart';
import 'package:flutter_task_12/src/views/signup/sign_up_screen.dart';
//core
import 'package:flutter_task_12/core/core_export.dart';

void main() async {
  await AppConfig().apply();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MainTheme.apply,
      initialRoute: _initRoute(),
      onGenerateRoute: RouteHandler.generateRoutes,
    );
  }

  String _initRoute() {
    bool? isLogin = sharedPreferences.getBool(IS_LOGIN);
    if (isLogin != null) {
      if (isLogin) {
        //generate current user model 
        Auth.setCurrentUser();
        return MainScreen.route;
      } else {
        return SignUpScreen.route;
      }
    }
    return SignUpScreen.route;
  }
}
