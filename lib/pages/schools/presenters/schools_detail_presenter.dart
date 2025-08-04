import 'package:flutter/material.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';

import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class SchoolsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/schools-detail/:data";

  // Declare a field that holds the Todo.
  late SchoolEntity? schoolEntity;

  SchoolsDetailPresenter();

  @override
  navigate(String route, Object? argument, BuildContext context) {
    super.navigate(route, argument, context);
  }
}
