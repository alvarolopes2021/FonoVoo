import 'package:fonovoo/application/usacases/groups/factories/make_load_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_delete_student_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

import 'package:fonovoo/application/usacases/students/factories/make_add_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class StudentsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-detail/:data";

  StudentsDto? studentsDto = StudentsDto();
  late ClassroomEntity? classroomEntity;
  late SchoolEntity? schoolEntity;
  List<GroupDto> groups = [];
  GroupDto? selectedGroup;
  bool loadedGroups = false;

  bool newStudent = false;

  late UseCase addStudentUseCase;
  late UseCase editStudentUsecase;
  late UseCase deleteStudentUsecase;
  late UseCase loadGroupsUsecase;

  StudentsDetailPresenter({required super.pageContext}) {
    addStudentUseCase = makeAddStudentUsecaseFactory;
    editStudentUsecase = makeEditStudentUsecaseFactory;
    deleteStudentUsecase = makeDeleteStudentUsecaseFactory;
    loadGroupsUsecase = makeLoadGroupsUsecaseFactory;
  }

  void updateDto(Object? data) async {
    Map<String, Object?> arguments = data as Map<String, Object?>;

    classroomEntity = arguments["classroom"] as ClassroomEntity?;
    schoolEntity = arguments["school"] as SchoolEntity?;
    StudentsDto? studentArgument = arguments["student"] as StudentsDto?;

    if (studentArgument == null) {
      newStudent = true;
    } else {
      studentsDto = studentArgument;
    }

    if (!loadedGroups) {
      List<GroupEntity> groupsEntity =
          await loadGroupsUsecase.execute(classroomEntity!.getId())
              as List<GroupEntity>;

      for (var item in groupsEntity) {
        GroupDto group = GroupDto(
          item.getId(),
          item.getName(),
          item.getClassId(),
        );

        if (group.getId() == studentsDto!.getGroupId()) {
          selectedGroup = group;
        }

        groups.add(group);
      }
      loadedGroups = true;
    }

    notifyListeners();
  }

  void selectStudentGroup(GroupDto groupDto) {
    selectedGroup = groupDto;
  }

  Future<List<StudentsDto>?> addStudent() async {
    try {
      if (classroomEntity == null) {
        return null;
      }

      studentsDto!.updateClassId(classroomEntity!.getId());

      if (selectedGroup != null) {
        studentsDto!.setGroupId(selectedGroup!.getId());
      }

      StudentsDto? newStudent =
          await addStudentUseCase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, newStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<StudentsEntity>?> editStudent() async {
    try {
      if (classroomEntity == null) {
        return null;
      }

      studentsDto!.updateClassId(classroomEntity!.getId());
      studentsDto!.setGroupId(selectedGroup!.getId());

      StudentsDto? editedStudent =
          await editStudentUsecase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, editedStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<StudentsEntity>?> deleteStudent() async {
    try {
      StudentsDto? editedStudent =
          await deleteStudentUsecase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, editedStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }
}
