import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_school_repository_factory.dart';
import 'package:fonovoo/domain/dtos/school_dto.dart';

import 'package:fonovoo/domain/entities/school_entity.dart';

class AddSchoolUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    SchoolDto? schoolDto = param as SchoolDto?;

    if (schoolDto == null) {
      return null;
    }

    SchoolEntity schoolEntity = SchoolEntity.create("", schoolDto.getName());

    bool res = await makeSchoolsRepositoryFactory.addSchool(schoolEntity);

    if (res) {
      return schoolEntity;
    }
  }
}
