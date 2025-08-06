import 'package:flutter/material.dart';

abstract class BasePresenter extends ChangeNotifier {
  BasePresenter({required this.pageContext});

  BuildContext pageContext;
}
