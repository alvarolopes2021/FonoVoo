import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/groups/factories/make_load_groups_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/students/presenters/students_list_presenter.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class GroupsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/groups-list";

  List<GroupDto> groups = [];
  List<StudentsDto> students = [];

  late Command0 load;

  late UseCase loadGroupsUsecase;

  GroupsListPresenter({required super.pageContext}) {
    loadGroupsUsecase = makeLoadGroupsUsecaseFactory;
    load = Command0(_load)..execute();
    var dto = StudentsDto();
    dto.setGroupId("2");
    dto.updateName("Benito");
    students = [dto, dto, dto, dto, dto, dto];
  }

  void updateDto(Object? school) {
    if (school == null) {
      return;
    }
  }

  Future<void> editClassroom(int index) async {
    GroupDto? editGroups =
        (await navigate(
              ClassroomDetailPresenter.pageName,
              groups[index],
              pageContext,
            ))
            as GroupDto?;

    if (editGroups == null) {
      return;
    }

    groups[index] = editGroups;
    notifyListeners();
  }

  Future<void> startGame() async {
    const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
    ScaffoldMessenger.of(super.pageContext).showSnackBar(snackBar);

    notifyListeners();
  }

  Future<void> goToStudentssPage(int index) async {
    GroupDto? editedGroup =
        (await navigate(
              StudentsListPresenter.pageName,
              groups[index],
              pageContext,
            ))
            as GroupDto?;

    if (editedGroup == null) {
      return;
    }

    groups[index] = editedGroup;
    notifyListeners();
  }

  Future<Result?> _load() async {
    try {
      List<GroupEntity>? loadedGroups =
          await loadGroupsUsecase.execute(null) as List<GroupEntity>?;

      if (loadedGroups == null || loadedGroups.isEmpty) {
        return load.result;
      }

      for (var group in loadedGroups) {
        GroupDto dto = GroupDto(group.getId(), group.getName());
        groups.add(dto);
      }

      return load.result;
    } catch (e) {
      return load.result;
    }
  }
}
