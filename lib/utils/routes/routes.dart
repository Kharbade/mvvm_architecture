import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/signUp_screen.dart';
import 'package:mvvm/view/splash_screen.dart';

import '../../view/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final argument = settings.arguments;
    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen(),);
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen(),);
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}