import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_school_repository_factory.dart';
import 'package:fonovoo/data/repositories/factories/make_students_repository_factory.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class AddStudentUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    StudentsEntity? studentDto = param as StudentsEntity?;

    if (studentDto == null) {
      return null;
    }

    StudentsEntity studentsEntity = StudentsEntity.create(
      "4",
      studentDto.getName(),
      "",
    );

    bool res = await makeStudentsRepositoryFactory.addStudent(studentsEntity);

    if (res) {
      return studentsEntity;
    }
  }
}
