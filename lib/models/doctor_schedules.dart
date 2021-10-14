import 'package:equatable/equatable.dart';

class DoctorSchedules  extends Equatable {
  final int doctorId;
  final String scheduleday;
  final String scheduleTime;
  final int PatientUserId;

  DoctorSchedules(this.doctorId, this.scheduleday, this.scheduleTime, this.PatientUserId);



  @override
  List<Object> get props => [doctorId, PatientUserId];

  @override
  String toString() {
    return 'Doctors { #id: $doctorId, name: $PatientUserId }';
  }

}
