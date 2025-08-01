import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class AddClassroomsUseCase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      ClassroomEntity classroomEntity = ClassroomEntity.create("id", "name");

      makeClassesRepositoryFactory.addClass(classroomEntity);

      return null;
    } catch (e) {
      return null;
    }
  }
}
