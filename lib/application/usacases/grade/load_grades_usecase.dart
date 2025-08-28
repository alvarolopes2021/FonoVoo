import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_students_grade_repository_factory.dart';

class LoadGradesUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeStudentsGradeRepositoryFactory.loadGrades();
    } catch (e) {
      return null;
    }
  }
}
