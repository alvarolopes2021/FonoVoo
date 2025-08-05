import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/schools/factories/make_add_school_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/school_dto.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';

import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class SchoolsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/schools-detail/:data";

  late BuildContext pageContext;

  late SchoolEntity? schoolEntity;

  SchoolDto schoolDto = SchoolDto();

  late UseCase addSchoolUseCase;

  SchoolsDetailPresenter({required this.pageContext}) {
    addSchoolUseCase = makeAddSchoolUsecaseFactory;
  }

  Future<List<SchoolEntity>?> addSchool() async {
    try {
      SchoolEntity? newSchool =
          await addSchoolUseCase.execute(schoolDto) as SchoolEntity?;
      pop(pageContext, newSchool);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<SchoolEntity>?> editSchool() async {
    try {
      return null;
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  @override
  void pop(BuildContext context, Object? argumentToReturn) {
    super.pop(context, argumentToReturn);
  }

  @override
  navigate(String route, Object? argument, BuildContext context) {
    return super.navigate(route, argument, context);
  }
}
