import 'package:flutter/material.dart';

List<Widget> buildAppBarActions(BuildContext context, VoidCallback function,
    VoidCallback clearSearch, _isSearching) {
  if (_isSearching) {
    return [
      IconButton(
        onPressed: () {
          clearSearch();
          // Navigator.pop(context);
        },
        icon: Icon(Icons.clear, color: Colors.black),
      ),
    ];
  } else {
    return [
      IconButton(
        onPressed: function,
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ];
  }
}
