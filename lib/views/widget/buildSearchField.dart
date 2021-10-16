import 'package:flutter/material.dart';

Widget buildSearchField(_searchTextController, Function(String) callback) {
  return TextField(
    controller: _searchTextController,
    cursorColor: Colors.grey,
    decoration: InputDecoration(
      hintText: 'Find a departments...',
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
    ),
    style: TextStyle(color: Colors.grey, fontSize: 18),
    onChanged: (searchedCharacter) {
      callback(searchedCharacter);
    },
  );
}
