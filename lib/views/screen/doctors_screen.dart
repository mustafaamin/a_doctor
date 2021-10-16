import 'package:a_doctor/blocs/bloc.dart';
import 'package:a_doctor/blocs/departments/departments_event.dart';
import 'package:a_doctor/blocs/departments/departments_state.dart';
import 'package:a_doctor/blocs/doctor/doctor_event.dart';
import 'package:a_doctor/blocs/doctor/doctor_state.dart';
import 'package:a_doctor/blocs/state.dart';
import 'package:a_doctor/models/departments.dart';
import 'package:a_doctor/models/doctors.dart';
import 'package:a_doctor/views/widget/buildAppBarActions.dart';
import 'package:a_doctor/views/widget/buildAppBarTitle.dart';
import 'package:a_doctor/views/widget/buildSearchField.dart';
import 'package:a_doctor/views/widget/item_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import '../../main.dart';

class DoctorsScreen extends StatefulWidget {
  late Departments departments;

  DoctorsScreen({required this.departments});

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  bool isSearching = false;
  final _searchTextController = TextEditingController();
  late Departments departments;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context)
        .add(GetAllDoctorsEvent(departmentID: widget.departments.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is FindDoctorsStates) {
        isSearching = state.isSearching;
      } else if (state is GetAllDepartmentsStates) {
        isSearching = state.isSearching;
      }
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            appBar: AppBar(
              title: isSearching
                  ? buildSearchField(_searchTextController, 'Doctors', (text) {
                      BlocProvider.of<AppBloc>(context).add(FindDoctorsEvent(
                          text: text, departmentID: widget.departments.id));
                    })
                  : buildAppBarTitle('Doctors'),
              actions: buildAppBarActions(context, () {
                _searchTextController.clear();
                BlocProvider.of<AppBloc>(context).add(FindDoctorsEvent(
                    text: '', departmentID: widget.departments.id));
              }, () {
                BlocProvider.of<AppBloc>(context).add(
                    GetAllDoctorsEvent(departmentID: widget.departments.id));
              }, isSearching),
            ),
            body: Builder(
              builder: (BuildContext context) {
                if (state is LoadDoctorsStates) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetAllDoctorsStates) {
                  return ListView.builder(
                    itemCount: state.doctors.length,
                    itemBuilder: (context, i) {
                      Doctors department = state.doctors[i];
                      return itemsDoctor(i, department, context, _bookingNow);
                    },
                  );
                } else if (state is FindDoctorsStates) {
                  return ListView.builder(
                    itemCount: state.doctors.length,
                    itemBuilder: (context, i) {
                      Doctors department = state.doctors[i];
                      return itemsDoctor(i, department, context, _bookingNow);
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
    BlocProvider.of<AppBloc>(context).add(GetAllDepartmentsEvent());
    return true;
  }

  _bookingNow(String name) async {


    DateTime? newDateTime = await showRoundedDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().day + 1),
        firstDate: DateTime(DateTime.now().day + 1),
        borderRadius: 16,
        initialDatePickerMode: DatePickerMode.day,
        theme: ThemeData(primarySwatch: Colors.blue),
        // textActionButton: "ACTION",
        // onTapActionButton: () {
        //   _showNoftictaion();
        // },
        // textPositiveButton: "OK",
        // textNegativeButton: "CANCEL"
    );
    _showNoftictaion(newDateTime,name);
  }

  _showNoftictaion(DateTime? newDateTime,name) async {

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Booking done', 'It\'s been a day ${newDateTime!.day}  with a doctor ${name}', platformChannelSpecifics,
        payload: 'item x');
  }
}
