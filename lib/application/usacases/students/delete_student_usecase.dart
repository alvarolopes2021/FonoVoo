import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_repository_factory.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class DeleteStudentUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    StudentsDto? studentsDto = param as StudentsDto?;

    if (studentsDto == null) {
      return null;
    }

    StudentsEntity studentsEntity = StudentsEntity.create(
      studentsDto.getId(),
      studentsDto.getName(),
      studentsDto.getClassId(),
      studentsDto.getGroupId(),
    );

    bool res = await makeStudentsRepositoryFactory.deleteStudent(
      studentsEntity,
    );

    if (res) {
      return studentsDto;
    }
  }
}
