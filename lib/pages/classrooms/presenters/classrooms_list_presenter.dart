import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/application/usacases/classes/factories/make_load_classrooms_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/students/presenters/students_list_presenter.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class ClassroomsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/classrooms-list";

  List<ClassroomEntity> classrooms = [];

  late SchoolEntity? schoolEntity;

  late Command0 load;

  late UseCase loadSchoolsUseCase;

  ClassroomsListPresenter({required super.pageContext}) {
    loadSchoolsUseCase = makeLoadClassroomsUsecaseFactory;
  }

  void updateDto(Object? school) {
    if (school == null) {
      return;
    }

    schoolEntity = school as SchoolEntity?;

    load = Command0(_load)..execute();
  }

  Future<void> editClassroom(int index) async {
    Map<String, Object?> parameter = {
      "school": schoolEntity,
      "classroom": classrooms[index],
    };

    ClassroomEntity? editClassroom = await _navigateToDetail(parameter);

    try {
      load.execute();
    } catch (e) {
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> addClassroom() async {
    Map<String, Object?> parameter = {
      "school": schoolEntity,
      "classroom": null,
    };

    ClassroomEntity? newClassroom = await _navigateToDetail(parameter);

    if (newClassroom == null) {
      return;
    }

    classrooms.add(newClassroom);
    notifyListeners();
  }

  Future<ClassroomEntity?> _navigateToDetail(dynamic param) async {
    ClassroomEntity? editClassroom =
        (await navigate(ClassroomDetailPresenter.pageName, param, pageContext))
            as ClassroomEntity?;

    return editClassroom;
  }

  Future<void> goToStudentssPage(int index) async {
    Map<String, Object?> parameter = {
      "school": schoolEntity,
      "classroom": classrooms[index],
    };

    ClassroomEntity? editedClassroom =
        (await navigate(StudentsListPresenter.pageName, parameter, pageContext))
            as ClassroomEntity?;

    if (editedClassroom == null) {
      return;
    }

    classrooms[index] = editedClassroom;
    notifyListeners();
  }

  Future<Result?> _load() async {
    try {
      classrooms =
          await loadSchoolsUseCase.execute(schoolEntity!.getId())
              as List<ClassroomEntity>;
      return load.result;
    } catch (e) {
      return load.result;
    }
  }
}
