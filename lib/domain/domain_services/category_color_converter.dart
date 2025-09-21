import 'package:flutter/material.dart';

class CategoryColorConverter {
  static Color stringToColor(String category) {
    Color colorToReturn = Colors.deepOrangeAccent;
    switch (category) {
      case "parlendas":
        colorToReturn = Colors.red;
        break;
      case "rimas":
        colorToReturn = Colors.green;
        break;
      case "frases":
        colorToReturn = Colors.blue;
        break;
      case "silabas":
        colorToReturn = Colors.yellow;
        break;
    }
    return colorToReturn;
  }
}
