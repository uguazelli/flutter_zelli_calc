import 'package:flutter/material.dart';

class AppStyle {
  double maxWidth = 400;
  double maxHeight = 780;
  double fontSize = 40;
  Color normalKey = Colors.white;
  Color accentKey = Colors.blue.shade300;
  Color normalKeyText = Colors.grey.shade700;
  Color accentKeyText = Colors.blue.shade800;

  AppStyle(double width, bool darkModeOn) {
    if (width <= 500) {
      //Small screen
      maxWidth = 400;
      maxHeight = 780;
      fontSize = 40;
    } else {
      //Big screen
      maxWidth = 768;
      maxHeight = 1024;
      fontSize = 25;
    }
    //Colors
    if (darkModeOn) {
      normalKey = Colors.grey;
      accentKey = Colors.purple.shade400;
      normalKeyText = Colors.white;
      accentKeyText = Colors.purple;
    }
  }
}
