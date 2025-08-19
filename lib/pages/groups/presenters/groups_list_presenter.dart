import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/groups/factories/make_load_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/game/presenters/game_page_presenter.dart';
import 'package:fonovoo/pages/students/presenters/students_list_presenter.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class GroupsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/groups-list";

  bool isSelecting = false;

  Map<String, List<StudentsDto>> studentsByGroup = {};

  List<GroupDto> groups = [];

  late Command0 load;
  late Command0 loadStudents;

  late UseCase loadGroupsUsecase;
  late UseCase loadStudentsUsecase;

  GroupsListPresenter({required super.pageContext}) {
    loadGroupsUsecase = makeLoadGroupsUsecaseFactory;
    loadStudentsUsecase = makeLoadStudentUsecaseFactory;
    load = Command0(_load)..execute();
    loadStudents = Command0(_loadStudents)..execute();
  }

  void updateDto(Object? school) {
    if (school == null) {
      return;
    }
  }

  void changeSelectionMode() {
    isSelecting = !isSelecting;
    notifyListeners();
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
    bool hasSelected = groups.where((group) => group.isSelected).isNotEmpty;

    if (hasSelected) {
      navigate(GamePagePresenter.pageName, null, pageContext);
    }
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
    } finally {
      notifyListeners();
    }
  }

  Future<Result?> _loadStudents() async {
    try {
      List<StudentsEntity>? studentsEntities =
          await loadStudentsUsecase.execute(null) as List<StudentsEntity>?;

      if (studentsEntities == null || studentsEntities.isEmpty) {
        return load.result;
      }

      List<StudentsDto> loadedStudents = [];

      for (var student in studentsEntities) {
        var dto = StudentsDto();
        dto.studentDtoMapping(student);
        loadedStudents.add(dto);
      }

      for (var group in groups) {
        for (var student in loadedStudents) {
          if (student.getGroupId() == group.getId()) {
            if (studentsByGroup.containsKey(group.getId())) {
              studentsByGroup[group.getId()]!.add(student);
            } else {
              studentsByGroup.addAll({
                group.getId(): [student],
              });
            }
          }
        }
      }

      return load.result;
    } catch (e) {
      return load.result;
    } finally {
      notifyListeners();
    }
  }
}
