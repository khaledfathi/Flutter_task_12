import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/config/app_config.dart';
import 'package:flutter_task_12/core/provider/global_providers/global_provider.dart';
import 'package:flutter_task_12/core/routes/routes_handler.dart';
import 'package:flutter_task_12/core/themes/main_theme.dart';
import 'package:flutter_task_12/src/views/login/login_screen.dart';
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
        ChangeNotifierProvider(create: (context)=>GlobalProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MainTheme.apply,
        initialRoute: LoginScreen.route,
        onGenerateRoute: RouteHandler.generateRoutes,
      ),
    );
  }
}