import 'dart:io';

import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_list_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_make_group_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/groups/presenters/groups_list_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';

class StudentsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-list";

  bool isSelecting = false;

  List<StudentsDto> studentsDto = [];
  List<GroupDto> groupList = [];

  late ClassroomEntity? classroomEntity;

  late UseCase loadStudentsUsecase;
  late UseCase makeGroupUsecase;
  late UseCase listGroupsUsecase;
  late UseCase editStudentsUsecase;

  late Command0 load;
  late Command0 loadGroups;

  StudentsListPresenter({required super.pageContext}) {
    loadStudentsUsecase = makeLoadStudentUsecaseFactory;
    listGroupsUsecase = makeListGroupsUsecaseFactory;
    makeGroupUsecase = makeMakeGroupUsecaseFactory;
    editStudentsUsecase = makeEditStudentUsecaseFactory;

    load = Command0(_load)..execute();
    loadGroups = Command0(_loadGroups)..execute();
  }

  void updateDto(Object? classroom) {
    if (classroom == null) {
      return;
    }

    classroomEntity = classroom as ClassroomEntity?;
  }

  void changeSelectionMode() {
    isSelecting = !isSelecting;
    notifyListeners();
  }

  void orderAz() {
    studentsDto.sort((a, b) => b.getName().compareTo(a.getName()));
    notifyListeners();
  }

  Future<Result?> _load() async {
    try {
      List<StudentsEntity> students =
          await loadStudentsUsecase.execute(null) as List<StudentsEntity>;

      if (students.isNotEmpty) {
        for (var student in students) {
          var dto = StudentsDto();
          dto.studentDtoMapping(student);
          studentsDto.add(dto);
        }
      }
      return load.result;
    } catch (e) {
      return load.result;
    } finally {
      notifyListeners();
    }
  }

  Future<Result?> _loadGroups() async {
    try {
      List<GroupEntity> groups =
          await listGroupsUsecase.execute(null) as List<GroupEntity>;

      if (groups.isNotEmpty) {
        for (var group in groups) {
          var dto = GroupDto(group.getId(), group.getName());
          groupList.add(dto);
        }
      }
      return load.result;
    } catch (e) {
      return load.result;
    } finally {
      notifyListeners();
    }
  }

  Future<void> editStudent(int index) async {
    StudentsDto studentToEdit = studentsDto.elementAt(index);

    StudentsDto? editedStudent =
        (await navigate(
              StudentsDetailPresenter.pageName,
              studentToEdit,
              pageContext,
            ))
            as StudentsDto?;

    if (editedStudent == null) {
      return;
    }

    studentsDto[index] = editedStudent;
    notifyListeners();
  }

  Future<void> goToGroupsPage() async {
    (await navigate(GroupsListPresenter.pageName, null, pageContext));
    notifyListeners();
  }

  Future<void> addStudent() async {
    StudentsDto? newStudent =
        (await navigate(StudentsDetailPresenter.pageName, null, pageContext))
            as StudentsDto?;

    if (newStudent == null) {
      return;
    }

    studentsDto.add(newStudent);
    notifyListeners();
  }

  Future<void> makeGroup() async {
    bool hasSelected = studentsDto.where((s) => s.isSelected).isNotEmpty;

    if (!hasSelected) {
      return;
    }

    String groupId = (groupList.length + 1).toString();
    GroupDto? newGroup = GroupDto(groupId, "Grupo $groupId");
    groupList.add(newGroup);

    newGroup = (await makeGroupUsecase.execute(newGroup)) as GroupDto?;

    for (var student in studentsDto) {
      if (student.isSelected) {
        student.belongsToGroup = student.isSelected;
        student.setGroupId(groupId);
        editStudentsUsecase.execute(student);
      }
      student.isSelected = false;
    }
    studentsDto.sort((a, b) => b.getGroupId()!.compareTo(a.getGroupId()!));

    notifyListeners();
  }
}
