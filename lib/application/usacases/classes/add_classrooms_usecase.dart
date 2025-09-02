import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/ids/factories/make_id_service_factory.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';
import 'package:fonovoo/domain/dtos/classroom_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class AddClassroomsUseCase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      ClassroomDto? classroom = param as ClassroomDto?;

      if (classroom == null) {
        return null;
      }

      String id = makeIdServiceFactory.generateId();
      ClassroomEntity classroomEntity = ClassroomEntity.create(
        id,
        classroom.getName(),
        classroom.getSchoolId(),
        classroom.getNumberOfStudents(),
      );

      makeClassesRepositoryFactory.addClass(classroomEntity);

      return classroomEntity;
    } catch (e) {
      return null;
    }
  }
}
