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
    return departments.where((department)=>department.name.toLowerCase().startsWith(text)).toList();
  }

  Future<List<Doctors>> getAllDoctors(int id) async {
    final String response = await rootBundle.loadString('assets/DBTemp/doctors.json');
    List<dynamic>  res =  await json.decode(response);
    List<Doctors> doctors = res.map((e) => Doctors.fromJson(e)).toList();

    List<Doctors> afterFindDoctorss = doctors.where((doctor)=>doctor.departmentId == id).toList();
    return afterFindDoctorss;
  }
  Future<List<Doctors>> findDoctors(int id,String text) async {
    final String response = await rootBundle.loadString('assets/DBTemp/doctors.json');
    List<dynamic>  res =  await json.decode(response);
    List<Doctors> doctors = res.map((e) => Doctors.fromJson(e)).toList();

    List<Doctors> afterFindDoctorss = doctors.where((doctor)=>doctor.departmentId == id).toList()
        .where((doctors)=>doctors.name.toLowerCase().startsWith(text)).toList();
    return afterFindDoctorss;
  }
}