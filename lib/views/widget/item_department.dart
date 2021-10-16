import 'package:flutter/material.dart';

Widget itemsDepartment(i,department,context) {
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
          title: Center(child: Text(department.name,style: TextStyle(
            fontSize: 22.0,
            color: Colors.blue,
          ))),
          subtitle: Center(child: Text('<< Swipe to view doctors >>')),
          leading: CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            child: Text(department.name.substring(0,1).toUpperCase()),
          ),
      ),
      // onTap: () => _navigateToNote(context, trips[position]),
    ),
  ]);
}