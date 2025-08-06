import 'package:flutter/material.dart';

import 'package:fonovoo/application/usacases/schools/factories/make_add_school_usecase_factory.dart';
import 'package:fonovoo/application/usacases/schools/factories/make_edit_school_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/school_dto.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';

import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class SchoolsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/schools-detail/:data";

  late SchoolEntity? schoolEntity;

  SchoolDto schoolDto = SchoolDto();

  late UseCase addSchoolUseCase;
  late UseCase editSchoolUseCase;

  SchoolsDetailPresenter({required super.pageContext}) {
    addSchoolUseCase = makeAddSchoolUsecaseFactory;
    editSchoolUseCase = makeEditSchoolUsecaseFactory;
  }

  void updateDto(Object? school) {
    schoolEntity = school as SchoolEntity?;

    if (schoolEntity == null) {
      return;
    }

    schoolDto.setId(schoolEntity!.getId());
    schoolDto.updateName(schoolEntity!.getName());
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
      SchoolEntity? newSchool =
          await editSchoolUseCase.execute(schoolDto) as SchoolEntity?;
      pop(pageContext, newSchool);
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
