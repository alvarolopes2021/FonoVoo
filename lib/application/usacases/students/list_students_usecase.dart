import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_repository_factory.dart';

class ListStudentUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeStudentsRepositoryFactory.listStudentsByClass(
        param.toString(),
      );
    } catch (e) {
      return null;
    }
  }
}
