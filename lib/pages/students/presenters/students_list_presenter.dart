import 'package:fonovoo/application/usacases/students/factories/make_load_students_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';

class StudentsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-list";

  List<StudentsEntity> students = [];

  late ClassroomEntity? classroomEntity;

  late Command0 load;

  late UseCase loadSchoolsUseCase;

  StudentsListPresenter({required super.pageContext}) {
    loadSchoolsUseCase = makeLoadStudentUsecaseFactory;
    load = Command0(_load)..execute();
  }

  void updateDto(Object? classroom) {
    if (classroom == null) {
      return;
    }

    classroomEntity = classroom as ClassroomEntity?;
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

  Future<Result?> _load() async {
    try {
      students = await loadSchoolsUseCase.execute(null) as List<StudentsEntity>;
      return load.result;
    } catch (e) {
      return load.result;
    }
  }
}
