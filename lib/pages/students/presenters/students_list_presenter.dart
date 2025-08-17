import 'package:collection/collection.dart';
import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/core/helpers/code_helpers.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';

class StudentsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-list";

  bool isSelecting = false;

  List<StudentsEntity> students = [];
  List<StudentsDto> studentsDto = [];
  List<GroupDto> groupList = [];

  late ClassroomEntity? classroomEntity;

  late UseCase loadSchoolsUseCase;

  Result isLoadingResult = Result.Ok;

  bool get isLoading => isLoadingResult == Result.Running;

  StudentsListPresenter({required super.pageContext}) {
    loadSchoolsUseCase = makeLoadStudentUsecaseFactory;
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
    studentsDto.sort((a, b) => a.getName().compareTo(b.getName()));
    notifyListeners();
  }

  Future<Result?> load() async {
    try {
      isLoadingResult = Result.Running;
      students = await loadSchoolsUseCase.execute(null) as List<StudentsEntity>;

      if (students.isNotEmpty) {
        for (var student in students) {
          var dto = StudentsDto();
          dto.studentDtoMapping(student);
          studentsDto.add(dto);
        }
      }

      isLoadingResult = Result.Ok;
      return isLoadingResult;
    } catch (e) {
      isLoadingResult = Result.Error;
      return isLoadingResult;
    } finally {
      notifyListeners();
    }
  }

  Future<void> editStudent(int index) async {
    StudentsEntity? editedStudent =
        (await navigate(
              StudentsDetailPresenter.pageName,
              students[index],
              pageContext,
            ))
            as StudentsEntity?;

    if (editedStudent == null) {
      return;
    }

    students[index] = editedStudent;
    notifyListeners();
  }

  Future<void> goToGroupsPage(int index) async {
    StudentsEntity? editedStudent =
        (await navigate(
              ClassroomsListPresenter.pageName,
              students[index],
              pageContext,
            ))
            as StudentsEntity?;

    if (editedStudent == null) {
      return;
    }

    students[index] = editedStudent;
    notifyListeners();
  }

  Future<void> addStudent() async {
    StudentsEntity? newStudent =
        (await navigate(StudentsDetailPresenter.pageName, null, pageContext))
            as StudentsEntity?;

    if (newStudent == null) {
      return;
    }

    students.add(newStudent);
    notifyListeners();
  }

  Future<void> makeGroup() async {
    String groupId = (groupList.length + 1).toString();
    groupList.add(GroupDto(groupId, "Grupo $groupId"));

    for (var student in studentsDto) {
      if (student.isSelected) {
        student.belongsToGroup = student.isSelected;
        student.setGroupId(groupId);
      }
      student.isSelected = false;
    }
    studentsDto.sort((a, b) => b.getGroupId()!.compareTo(a.getGroupId()!));

    notifyListeners();
  }
}
