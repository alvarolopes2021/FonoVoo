import 'package:flutter/material.dart';
import 'package:fonovoo/pages/base_presenter.dart';

abstract class BasePage extends StatelessWidget {
  BasePresenter presenter;

  String? title = "";

  BasePage({super.key, this.title, required this.presenter});
}
