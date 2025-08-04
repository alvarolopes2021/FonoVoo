import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_school_repository_factory.dart';

import 'package:fonovoo/domain/entities/school_entity.dart';

class ListSchoolsUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeSchoolsRepositoryFactory.loadSchools();
    } catch (e) {
      return null;
    }
  }
}
