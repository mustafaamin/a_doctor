import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget itemsDoctor(i, doctors, context,Function(String) function) {
  return Card(
    color: Colors.black12,
    shadowColor: Colors.lightBlue,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.white70, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Dismissible(
      confirmDismiss: (DismissDirection direction) async {
        Alert(
          context: context,
          title: "Booking with doctor",
          desc:doctors.name,

          buttons: [
            DialogButton(
              child: Text(
                "Booking",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
                function(doctors.name);
              },
            ),
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
            )
          ],
        ).show();

        return false;
      },
      background: Container(
        color: Colors.blueAccent,
        child: Text(''),
      ),
      key: Key(i.toString()),
      child: ListTile(
        title: Center(child: Text(doctors.name)),
        subtitle: Center(child: Text('<< Swipe to booking >>')),
        leading: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          child: Text(doctors.name.substring(0, 1).toUpperCase()),
        ),
      ),
      // onTap: () => _navigateToNote(context, trips[position]),
    ),
  );
}
