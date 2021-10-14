import 'package:equatable/equatable.dart';

class Departments extends Equatable {
  final int id;
  final String name;

  Departments(this.id, this.name);



  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'Departments { #id: $id, name: $name }';
  }

}
