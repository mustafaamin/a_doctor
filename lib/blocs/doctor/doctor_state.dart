import 'package:a_doctor/models/doctors.dart';

import '../state.dart';

class LoadDoctorsStates extends AppState {
  @override
  List<Object?> get props => [];
}

class GetAllDoctorsStates extends AppState {
  late List<Doctors> doctors;
  late bool isSearching;

  GetAllDoctorsStates({required this.doctors,required this.isSearching});

  @override
  List<Object?> get props => [isSearching,doctors];
}


class FindDoctorsStates extends AppState {
  late List<Doctors> doctors;
  late bool isSearching;

  FindDoctorsStates({required this.doctors,required this.isSearching});

  @override
  List<Object?> get props => [isSearching,doctors];
}

