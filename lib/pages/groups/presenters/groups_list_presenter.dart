import 'package:fonovoo/application/usacases/groups/factories/make_delete_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/groups/factories/make_load_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_delete_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/game/presenters/game_page_presenter.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class GroupsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/groups-list";

  bool isSelecting = false;

  late ClassroomEntity? classroomEntity;
  late SchoolEntity? schoolEntity;
  Map<String, List<StudentsDto>> studentsByGroup = {};

  List<StudentsDto> loadedStudents = [];
  List<GroupDto> groups = [];

  late Command0 load;
  late Command0 loadStudents;

  late UseCase loadGroupsUsecase;
  late UseCase loadStudentsUsecase;
  late UseCase editStudentsUsecase;
  late UseCase deleteGroupUsecase;

  GroupsListPresenter({required super.pageContext}) {
    loadGroupsUsecase = makeLoadGroupsUsecaseFactory;
    loadStudentsUsecase = makeLoadStudentUsecaseFactory;
    editStudentsUsecase = makeEditStudentUsecaseFactory;
    deleteGroupUsecase = makeDeleteGroupsUsecaseFactory;
  }

  void updateDto(Object? data) {
    if (data == null) {
      return;
    }

    Map<String, Object?> argument = data as Map<String, Object?>;

    classroomEntity = argument["classroom"] as ClassroomEntity?;
    schoolEntity = argument["school"] as SchoolEntity?;

    load = Command0(_load)..execute();
    loadStudents = Command0(_loadStudents)..execute();
  }

  void changeSelectionMode() {
    isSelecting = !isSelecting;
    notifyListeners();
  }

  Future<void> goToGamePage() async {
    List<GroupDto> selecteds = groups.where((g) => g.isSelected).toList();

    if (selecteds.isEmpty) {
      return;
    }
    Map<String, List<StudentsDto>> selectedMap = {};

    for (var cell in studentsByGroup.entries) {
      for (var group in selecteds) {
        if (cell.key == group.getId()) {
          selectedMap.addAll({cell.key: cell.value});
        }
      }
    }

    GroupDto? editedGroup =
        (await navigate(GamePagePresenter.pageName, selectedMap, pageContext))
            as GroupDto?;

    if (editedGroup == null) {
      return;
    }

    notifyListeners();
  }

  Future<Result?> _load() async {
    if (classroomEntity == null) {
      return Result.Error;
    }
    try {
      List<GroupEntity>? loadedGroups =
          await loadGroupsUsecase.execute(classroomEntity!.getId())
              as List<GroupEntity>?;

      if (loadedGroups == null || loadedGroups.isEmpty) {
        return load.result;
      }

      for (var group in loadedGroups) {
        GroupDto dto = GroupDto(
          group.getId(),
          group.getName(),
          group.getClassId(),
        );
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
    studentsByGroup = {};
    loadedStudents = [];

    if (classroomEntity == null) {
      return Result.Error;
    }
    try {
      List<StudentsEntity>? studentsEntities =
          await loadStudentsUsecase.execute(classroomEntity!.getId())
              as List<StudentsEntity>?;

      if (studentsEntities == null || studentsEntities.isEmpty) {
        return load.result;
      }

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

  Future<void> removeStudentFromGroup(
    String groupId,
    StudentsDto student,
  ) async {
    student.setGroupId("");

    StudentsDto? res =
        await editStudentsUsecase.execute(student) as StudentsDto?;

    if (res == null) {
      return;
    }

    studentsByGroup[groupId]!.remove(student);

    if (studentsByGroup[groupId]!.isEmpty) {
      GroupDto groupToRemove = groups.firstWhere(
        (group) => group.getId() == groupId,
      );
      deleteGroupUsecase.execute(groupToRemove);
      groups.remove(groupToRemove);
      studentsByGroup.removeWhere((key, value) => key == groupId);
    }

    _loadStudents();
  }
}
