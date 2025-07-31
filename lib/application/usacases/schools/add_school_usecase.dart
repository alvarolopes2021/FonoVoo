import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_school_repository_factory.dart';

import 'package:fonovoo/domain/entities/school_entity.dart';

class AddSchoolUsecase implements UseCase {
  @override
  Object? execute(Object? param) {
    try {
      SchoolEntity schoolEntity = SchoolEntity.create("id", "name");

      makeSchoolsRepositoryFactory.addSchool(schoolEntity);

      return null;
    } catch (e) {
      return null;
    }
  }
}
