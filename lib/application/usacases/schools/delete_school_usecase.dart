import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_school_repository_factory.dart';
import 'package:fonovoo/domain/dtos/school_dto.dart';

import 'package:fonovoo/domain/entities/school_entity.dart';

class DeleteSchoolUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    SchoolDto? schoolDto = param as SchoolDto?;

    if (schoolDto == null) {
      return null;
    }

    SchoolEntity schoolEntity = SchoolEntity.create(
      schoolDto.getId(),
      schoolDto.getName(),
    );

    return await makeSchoolsRepositoryFactory.deleteSchool(schoolEntity);
  }
}
