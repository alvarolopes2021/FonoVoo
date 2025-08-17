import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_repository_factory.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class AddStudentUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    StudentsDto? studentDto = param as StudentsDto?;

    if (studentDto == null) {
      return null;
    }

    StudentsEntity studentsEntity = StudentsEntity.create(
      "4",
      studentDto.getName(),
      "",
      studentDto.getGroupId(),
    );

    bool res = await makeStudentsRepositoryFactory.addStudent(studentsEntity);

    if (res) {
      return studentDto;
    }
  }
}
