import 'package:a_doctor/AppRouter.dart';
import 'package:a_doctor/AppTheme.dart';
import 'package:a_doctor/models/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';
import 'blocs/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(InitialState(),Repository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.customTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

