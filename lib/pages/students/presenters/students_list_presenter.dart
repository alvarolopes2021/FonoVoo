import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_list_groups_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_make_group_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/groups/presenters/groups_list_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';
import 'package:fonovoo/pages/students/presenters/students_status_presenter.dart';

class StudentsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-list";

  bool isSelecting = false;

  List<StudentsDto> studentsDto = [];
  List<GroupDto> groupsDto = [];

  late ClassroomEntity? classroomEntity;
  late SchoolEntity? schoolEntity;

  late UseCase loadStudentsUsecase;
  late UseCase makeGroupUsecase;
  late UseCase listGroupsUsecase;
  late UseCase editStudentsUsecase;

  late Command0 load;

  StudentsListPresenter({required super.pageContext}) {
    loadStudentsUsecase = makeLoadStudentUsecaseFactory;
    listGroupsUsecase = makeListGroupsUsecaseFactory;
    makeGroupUsecase = makeMakeGroupUsecaseFactory;
    editStudentsUsecase = makeEditStudentUsecaseFactory;
  }

  void updateDto(Object? data) {
    if (data == null) {
      return;
    }

    Map<String, Object?> argument = data as Map<String, Object?>;

    classroomEntity = argument["classroom"] as ClassroomEntity?;
    schoolEntity = argument["school"] as SchoolEntity?;

    load = Command0(_load)..execute();
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
    studentsDto = [];

    try {
      List<StudentsEntity> students =
          await loadStudentsUsecase.execute(classroomEntity!.getId())
              as List<StudentsEntity>;

      if (students.isEmpty) return Result.Ok;

      for (var student in students) {
        var dto = StudentsDto();
        dto.studentDtoMapping(student);
        studentsDto.add(dto);
      }

      if (classroomEntity == null) {
        return Result.Error;
      }

      List<GroupEntity> groups =
          await listGroupsUsecase.execute(classroomEntity!.getId())
              as List<GroupEntity>;

      if (groups.isNotEmpty) {
        for (var group in groups) {
          var dto = GroupDto(
            group.getId(),
            group.getName(),
            group.getClassId(),
          );
          groupsDto.add(dto);
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
    Map<String, Object?> parameter = {
      "school": schoolEntity,
      "classroom": classroomEntity,
      "student": studentsDto.elementAt(index),
    };

    StudentsDto? editedStudent =
        (await navigate(
              StudentsDetailPresenter.pageName,
              parameter,
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

  Future<void> goToStudentStatusPage(StudentsDto student) async {
    (await navigate(StudentsStatusPresenter.pageName, student, pageContext));
  }

  Future<void> addStudent() async {
    Map<String, Object?> parameter = {
      "school": schoolEntity,
      "classroom": classroomEntity,
      "student": null,
    };

    StudentsDto? newStudent =
        (await navigate(
              StudentsDetailPresenter.pageName,
              parameter,
              pageContext,
            ))
            as StudentsDto?;

    if (newStudent == null) {
      return;
    }

    studentsDto.add(newStudent);
    notifyListeners();
  }

  Future<void> makeGroup() async {
    List<StudentsDto> selecteds = studentsDto
        .where((s) => s.isSelected)
        .toList();

    if (selecteds.isEmpty) {
      return;
    }

    if (classroomEntity == null) {
      return;
    }

    String groupId = (groupsDto.length + 1).toString();
    GroupDto? newGroup = GroupDto(
      groupId,
      "Grupo $groupId",
      classroomEntity!.getId(),
    );
    groupsDto.add(newGroup);

    newGroup = (await makeGroupUsecase.execute(newGroup)) as GroupDto?;

    if (newGroup == null) {
      return;
    }

    for (var student in studentsDto) {
      if (student.isSelected) {
        student.belongsToGroup = student.isSelected;
        student.setGroupId(newGroup.getId());
        editStudentsUsecase.execute(student);
      }
      student.isSelected = false;
    }
    studentsDto.sort((a, b) => b.getGroupId()!.compareTo(a.getGroupId()!));

    notifyListeners();
  }
}
