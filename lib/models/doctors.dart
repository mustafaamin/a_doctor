import 'package:equatable/equatable.dart';

class Doctors  extends Equatable {
  final int id;
  final String name;
  final int departmentId;

  Doctors(this.id, this.name, this.departmentId);



  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'Doctors { #id: $id, name: $name }';
  }

}
