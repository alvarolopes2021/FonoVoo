import 'package:flutter/material.dart';

mixin NavigationMixin {
  void navigate(String route, Object? arguments, BuildContext context) {
    Navigator.pushNamed(context, route, arguments: arguments);
  } // Abstract method.
}
