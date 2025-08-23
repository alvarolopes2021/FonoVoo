import 'package:flutter/material.dart';

class ColorConverter {
  static Color stringToColor(String color) {
    Color colorToReturn = Colors.deepOrangeAccent;
    switch (color) {
      case "red":
        colorToReturn = Colors.red;
        break;
      case "blue":
        colorToReturn = Colors.blue;
        break;
      case "green":
        colorToReturn = Colors.green;
        break;
      case "yellow":
        colorToReturn = Colors.yellow;
        break;
    }
    return colorToReturn;
  }
}
