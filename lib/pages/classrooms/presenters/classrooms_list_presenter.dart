import 'package:fonovoo/application/usacases/classes/factories/make_load_classrooms_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class ClassroomsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/classrooms-list";

  List<ClassroomEntity> classrooms = [];

  late SchoolEntity? schoolEntity;

  late Command0 load;

  late UseCase loadSchoolsUseCase;

  ClassroomsListPresenter({required super.pageContext}) {
    loadSchoolsUseCase = makeLoadClassroomsUsecaseFactory;
    load = Command0(_load)..execute();
  }

  void updateDto(Object? school) {
    if (school == null) {
      return;
    }

    schoolEntity = school as SchoolEntity?;
  }

  Future<void> editClassroom(int index) async {
    ClassroomEntity? editClassroom =
        (await navigate(
              ClassroomDetailPresenter.pageName,
              classrooms[index],
              pageContext,
            ))
            as ClassroomEntity?;

    if (editClassroom == null) {
      return;
    }

    classrooms[index] = editClassroom;
    notifyListeners();
  }

  Future<void> addClassroom() async {
    ClassroomEntity? newClassroom =
        (await navigate(ClassroomDetailPresenter.pageName, null, pageContext))
            as ClassroomEntity?;

    if (newClassroom == null) {
      return;
    }

    classrooms.add(newClassroom);
    notifyListeners();
  }

  Future<void> goToStudentssPage(int index) async {}

  Future<Result?> _load() async {
    try {
      classrooms =
          await loadSchoolsUseCase.execute(null) as List<ClassroomEntity>;
      return load.result;
    } catch (e) {
      return load.result;
    }
  }
}
