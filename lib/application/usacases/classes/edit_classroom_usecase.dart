import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';
import 'package:fonovoo/domain/dtos/classroom_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class EditClassroomUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    ClassroomDto? classroomDto = param as ClassroomDto?;

    if (classroomDto == null) {
      return null;
    }

    ClassroomEntity classroomEntity = ClassroomEntity.create(
      classroomDto.getId(),
      classroomDto.getName(),
      classroomDto.getSchoolId(),
      classroomDto.getNumberOfStudents(),
    );

    bool res = await makeClassesRepositoryFactory.editClass(classroomEntity);

    if (res) {
      return classroomEntity;
    }
  }
}
