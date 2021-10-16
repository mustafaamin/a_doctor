import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget containerPageView(String path,String text) {
  return Container(
      child: Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Lottie.asset('assets/lottiefiles/'+path),
      SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 1,
      )
    ],
  ));
}
