import 'package:a_doctor/views/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>SplashScreen());
    }
  }
}