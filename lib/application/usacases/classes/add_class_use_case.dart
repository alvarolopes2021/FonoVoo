import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';
import 'package:fonovoo/domain/entities/class_entity.dart';

class AddClassUseCase implements UseCase {
  @override
  Object? execute(Object? param) {
    try {
      ClassEntity classEntity = ClassEntity.create("id", "name");

      makeClassesRepositoryFactory.addClass(classEntity);

      return null;
    } catch (e) {
      return null;
    }
  }
}
