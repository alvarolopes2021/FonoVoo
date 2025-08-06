import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_classes_repository_factory.dart';

class ListClassroomsUseCase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeClassesRepositoryFactory.listClassrooms();
    } catch (e) {
      return null;
    }
  }
}
