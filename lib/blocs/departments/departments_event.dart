import '../event.dart';

class GetAllDepartmentsEvent extends AppEvent {}

class FindDepartmentsEvent extends AppEvent {
  late String text;
  FindDepartmentsEvent({required this.text});
}