import 'package:a_doctor/models/departments.dart';

import '../state.dart';

class LoadDepartmentsStates extends AppState {
  @override
  List<Object?> get props => [];
}

class GetAllDepartmentsStates extends AppState {
  late List<Departments> departments;
  late bool isSearching;

  GetAllDepartmentsStates({required this.departments,required this.isSearching});

  @override
  List<Object?> get props => [isSearching,departments];
}


class FindDepartmentsStates extends AppState {
  late List<Departments> departments;
  late bool isSearching;

  FindDepartmentsStates({required this.departments,required this.isSearching});

  @override
  List<Object?> get props => [isSearching,departments];
}

