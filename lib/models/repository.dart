import 'dart:convert';

import 'package:flutter/services.dart';

import 'departments.dart';
import 'doctors.dart';

class Repository{



  Future<List<Departments>> getAlldepartments() async {
    final String response = await rootBundle.loadString('assets/DBTemp/departments.json');
    List<dynamic>  res =  await json.decode(response);
    return res.map((e) => Departments.fromJson(e)).toList();
  }

  Future<List<Departments>> finddepartments(String text) async {
    final String response = await rootBundle.loadString('assets/DBTemp/departments.json');
    List<dynamic>  res =  await json.decode(response);
    List<Departments> departments = res.map((e) => Departments.fromJson(e)).toList();
    List<Departments> afterFinddepartments = departments.where((department)=>department.name.toLowerCase().startsWith(text)).toList();
    return afterFinddepartments;
  }

  Future<List<Doctors>> getAlldoctors() async {
    final String response = await rootBundle.loadString('assets/DBTemp/doctors.json');
    List<dynamic>  res =  await json.decode(response);
    return res.map((e) => Doctors.fromJson(e)).toList();
  }

}