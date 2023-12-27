import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/config/app_config.dart';
import 'package:flutter_task_12/core/routes/routes_handler.dart';
import 'package:flutter_task_12/src/views/splash/splash_screen.dart';

void main ()async{
  await AppConfig().apply();
  runApp(const App()); 
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      onGenerateRoute: RouteHandler.generateRoutes,
    );
  }
}