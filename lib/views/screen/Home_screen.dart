import 'package:a_doctor/blocs/bloc.dart';
import 'package:a_doctor/blocs/departments/departments_event.dart';
import 'package:a_doctor/blocs/departments/departments_state.dart';
import 'package:a_doctor/blocs/state.dart';
import 'package:a_doctor/models/departments.dart';
import 'package:a_doctor/views/widget/buildAppBarActions.dart';
import 'package:a_doctor/views/widget/buildAppBarTitle.dart';
import 'package:a_doctor/views/widget/buildSearchField.dart';
import 'package:a_doctor/views/widget/item_department.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context).add(GetAllDepartmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is FindDepartmentsStates) {
        isSearching = state.isSearching;
      } else if (state is GetAllDepartmentsStates) {
        isSearching = state.isSearching;
      }
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            appBar: AppBar(
              title: isSearching
                  ? buildSearchField(_searchTextController,'Departments', (text) {
                      BlocProvider.of<AppBloc>(context)
                          .add(FindDepartmentsEvent(text: text));
                    })
                  : buildAppBarTitle('Departments'),
              actions: buildAppBarActions(context, () {
                _searchTextController.clear();
                BlocProvider.of<AppBloc>(context)
                    .add(FindDepartmentsEvent(text: ''));
              }, () {
                BlocProvider.of<AppBloc>(context).add(GetAllDepartmentsEvent());
              }, isSearching),
            ),
            body: Builder(
              builder: (BuildContext context) {
                if (state is LoadDepartmentsStates) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetAllDepartmentsStates) {
                  return ListView.builder(
                    itemCount: state.departments.length,
                    itemBuilder: (context, i) {
                      Departments department = state.departments[i];
                      return itemsDepartment(i,department,context);
                    },
                  );
                } else if (state is FindDepartmentsStates) {
                  return ListView.builder(
                    itemCount: state.departments.length,
                    itemBuilder: (context, i) {
                      Departments department = state.departments[i];
                      return itemsDepartment(i,department,context);
                    },
                  );
                }
                return Container();
              },
            )),
      );
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
}
