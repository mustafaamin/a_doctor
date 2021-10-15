import 'package:a_doctor/AppRouter.dart';
import 'package:a_doctor/AppTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter =AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.customTheme,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

