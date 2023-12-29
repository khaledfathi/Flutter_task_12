import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/config/app_config.dart';
import 'package:flutter_task_12/core/states/global_states/global_state.dart';
import 'package:flutter_task_12/core/routes/routes_handler.dart';
import 'package:flutter_task_12/core/states/login_screen_states/login_screen_login_state.dart';
import 'package:flutter_task_12/core/states/login_screen_states/login_screen_password_state.dart';
import 'package:flutter_task_12/core/themes/main_theme.dart';
import 'package:flutter_task_12/src/views/signup/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main ()async{
  await AppConfig().apply();
  runApp(const App()); 
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>GlobalState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MainTheme.apply,
        initialRoute: SignUpScreen.route,
        onGenerateRoute: RouteHandler.generateRoutes,
      ),
    );
  }
}