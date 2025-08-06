import 'package:fonovoo/application/usacases/schools/factories/make_load_schools_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/schools/presenters/schools_detail_presenter.dart';

class SchoolsListPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/schools-list";

  List<SchoolEntity> schools = [];

  late Command0 load;

  late UseCase loadSchoolsUseCase;

  SchoolsListPresenter({required super.pageContext}) {
    loadSchoolsUseCase = makeLoadSchoolsUsecaseFactory;
    load = Command0(_load)..execute();
  }

  Future<void> editSchool(int index) async {
    SchoolEntity? editedSchool =
        (await navigate(
              SchoolsDetailPresenter.pageName,
              schools[index],
              pageContext,
            ))
            as SchoolEntity?;

    if (editedSchool == null) {
      return;
    }

    schools[index] = editedSchool;
    notifyListeners();
  }

  Future<void> goToClassroomsPage(int index) async {
    SchoolEntity? editedSchool =
        (await navigate(
              ClassroomsListPresenter.pageName,
              schools[index],
              pageContext,
            ))
            as SchoolEntity?;

    if (editedSchool == null) {
      return;
    }

    schools[index] = editedSchool;
    notifyListeners();
  }

  Future<void> addSchool() async {
    SchoolEntity? newSchool =
        (await navigate(SchoolsDetailPresenter.pageName, null, pageContext))
            as SchoolEntity?;

    if (newSchool == null) {
      return;
    }

    schools.add(newSchool);
    notifyListeners();
  }

  Future<Result?> _load() async {
    try {
      schools = await loadSchoolsUseCase.execute(null) as List<SchoolEntity>;
      return load.result;
    } catch (e) {
      return load.result;
    }
  }
}
