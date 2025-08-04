import 'package:fonovoo/application/usacases/schools/factories/make_load_schools_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class SchoolsListPresenter extends BasePresenter {
  late Command0 load;

  List<SchoolEntity> schools = [];

  late UseCase loadSchoolsUseCase;

  SchoolsListPresenter() {
    loadSchoolsUseCase = makeLoadSchoolsUsecaseFactory;
    load = Command0(_load)..execute();
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
