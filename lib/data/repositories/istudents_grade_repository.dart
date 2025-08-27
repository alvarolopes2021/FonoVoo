import 'package:fonovoo/domain/entities/students_category_entity.dart';

abstract class IStudentsGradeRepository {
  Future<bool> addGradeToStudent(StudentsCategoryEntity studentsCategoryEntity);
  Future<List<StudentsCategoryEntity>> loadGrades();
}
