import 'package:flutter/material.dart';

Widget ItemsDepartment(i,department,context) {
  return Column(children: [
    Divider(height: 15.0),
    Dismissible(
      confirmDismiss: (DismissDirection direction) async {
        Navigator.pushNamed(context, '/doctors' , arguments: department);
        return false;
      },
      background: Container(
        color: Colors.blueAccent,
        child: Text(''),
      ),
      key: Key(i.toString()),
      child: ListTile(
          title: Center(child: Text(department.name)),
          subtitle: Center(child: Text('<< Swipe to view doctors >>'))
      ),
      // onTap: () => _navigateToNote(context, trips[position]),
    ),
  ]);
}