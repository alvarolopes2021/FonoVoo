import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/schools/factories/make_load_schools_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class SchoolsListPresenter extends BasePresenter with NavigationMixin {
  late Command0 load;

  static String pageName = "/schools-list";

  List<SchoolEntity> schools = [];

  late UseCase loadSchoolsUseCase;

  SchoolsListPresenter() {
    loadSchoolsUseCase = makeLoadSchoolsUsecaseFactory;
    load = Command0(_load)..execute();
  }

  Future<Result?> _load() async {
    try {
      schools = await loadSchoolsUseCase.execute(null) as List<SchoolEntity>;
      return load.result;
    } catch (e) {
      return load.result;
    }
  }

  @override
  navigate(String route, Object? argument, BuildContext context) {
    super.navigate(route, argument, context);
  }
}
