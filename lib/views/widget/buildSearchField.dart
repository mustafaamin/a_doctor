import 'package:flutter/material.dart';

Widget buildSearchField(_searchTextController,String name, Function(String) callback) {
  return TextField(
    controller: _searchTextController,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintText: 'Find a $name...',
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.black, fontSize: 18),
    ),
    style: TextStyle(color: Colors.black, fontSize: 18),
    onChanged: (searchedCharacter) {
      callback(searchedCharacter);
    },
  );
}
