import 'package:flutter/material.dart';

import 'package:fonovoo/application/usacases/schools/factories/make_load_schools_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/schools/presenters/schools_detail_presenter.dart';

class SchoolsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/schools-list";

  late BuildContext pageContext;

  List<SchoolEntity> schools = [];

  late Command0 load;

  late UseCase loadSchoolsUseCase;

  SchoolsListPresenter({required this.pageContext}) {
    loadSchoolsUseCase = makeLoadSchoolsUsecaseFactory;
    load = Command0(_load)..execute();
  }

  Future<void> editSchool(int index) async {
    SchoolEntity? editedSchool =
        (await navigate(
              SchoolsDetailPresenter.pageName,
              schools[index],
              pageContext,
            ))
            as SchoolEntity?;

    if (editedSchool == null) {
      return;
    }

    schools[index] = editedSchool;
    notifyListeners();
  }

  Future<void> addSchool() async {
    SchoolEntity? newSchool =
        (await navigate(SchoolsDetailPresenter.pageName, null, pageContext))
            as SchoolEntity?;

    if (newSchool == null) {
      return;
    }

    schools.add(newSchool);
    notifyListeners();
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
  Future<Object?> navigate(
    String route,
    Object? argument,
    BuildContext context,
  ) {
    return super.navigate(route, argument, context);
  }
}
