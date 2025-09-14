import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_grade_repository_factory.dart';

class LoadGradesByStudentUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeStudentsGradeRepositoryFactory.loadGradesByStudent(
        param.toString(),
      );
    } catch (e) {
      return null;
    }
  }
}
