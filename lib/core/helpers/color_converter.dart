import 'package:flutter/material.dart';

class ColorConverter {
  static Color stringToColor(String color) {
    Color colorToReturn = Colors.deepOrangeAccent;
    switch (color) {
      case "RED":
        colorToReturn = Colors.red;
        break;
      case "BLUE":
        colorToReturn = Colors.blue;
        break;
      case "GREEN":
        colorToReturn = Colors.green;
        break;
      case "YELLOW":
        colorToReturn = Colors.yellow;
        break;
    }
    return colorToReturn;
  }
}
