import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';
import 'package:fonovoo/domain/dtos/classroom_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class DeleteClassroomUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    ClassroomDto? classroomdto = param as ClassroomDto?;

    if (classroomdto == null) {
      return null;
    }

    ClassroomEntity classroomEntity = ClassroomEntity.create(
      classroomdto.getId(),
      classroomdto.getName(),
      classroomdto.getSchoolId(),
    );

    return await makeClassesRepositoryFactory.deleteClass(classroomEntity);
  }
}
