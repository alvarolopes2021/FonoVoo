import 'package:flutter/material.dart';

class CategoryColorConverter {
  static Color stringToColor(String category) {
    Color colorToReturn = Colors.deepOrangeAccent;
    switch (category) {
      case "frases":
        colorToReturn = Colors.red;
        break;
      case "rimas":
        colorToReturn = Colors.green;
        break;
      case "parlendas":
        colorToReturn = Colors.blue;
        break;
      case "silabas":
        colorToReturn = Colors.yellow;
        break;
    }
    return colorToReturn;
  }
}
