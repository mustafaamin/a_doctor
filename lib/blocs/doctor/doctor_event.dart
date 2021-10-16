import '../event.dart';

class GetAllDoctorsEvent extends AppEvent {
  late int departmentID;
  GetAllDoctorsEvent({required this.departmentID});
}

class FindDoctorsEvent extends AppEvent {
  late int departmentID;
  late String text;
  FindDoctorsEvent({required this.text,required this.departmentID});
}