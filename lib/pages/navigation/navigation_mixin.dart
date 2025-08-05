import 'package:flutter/material.dart';

mixin NavigationMixin {
  Future<Object?> navigate(
    String route,
    Object? arguments,
    BuildContext context,
  ) {
    return Navigator.pushNamed(context, route, arguments: arguments);
  } // Abstract method.

  void pop(BuildContext context, Object? argumentToReturn) {
    Navigator.pop(context, argumentToReturn);
  } // Abstract method.
}
