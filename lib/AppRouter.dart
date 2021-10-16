import 'package:a_doctor/models/departments.dart';
import 'package:a_doctor/views/screen/Home_screen.dart';
import 'package:a_doctor/views/screen/doctors_screen.dart';
import 'package:a_doctor/views/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      case '/doctors':
        final department = routeSettings.arguments as Departments;
        return MaterialPageRoute(builder: (_)=>DoctorsScreen(departments: department,));
    }
  }
}