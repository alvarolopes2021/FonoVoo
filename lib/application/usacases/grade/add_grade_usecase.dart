import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_grade_repository_factory.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';

class AddGradeUseCase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      if (param == null) {
        return null;
      }

      StudentsCategoryDto categoryDto = param as StudentsCategoryDto;

      StudentsCategoryEntity categoryEntity = StudentsCategoryEntity.create(
        categoryDto.getId(),
        categoryDto.getStudentId(),
        categoryDto.getCategoryId(),
        categoryDto.getGrade(),
      );

      return await makeStudentsGradeRepositoryFactory.addGradeToStudent(
        categoryEntity,
      );
    } catch (e) {
      return null;
    }
  }
}
