class Doctors {
  late int id;
  late String name;
  late int departmentId;

  Doctors({required this.id, required this.name, required this.departmentId});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['departmentId'] = this.departmentId;
    return data;
  }
}