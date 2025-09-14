import 'package:fonovoo/domain/entities/students_category_entity.dart';

abstract class IStudentsGradeRepository {
  Future<bool> addGradeToStudent(StudentsCategoryEntity studentsCategoryEntity);
  Future<List<StudentsCategoryEntity>?> loadGradesByMatch(String matchid);
  Future<List<StudentsCategoryEntity>?> loadGradesByStudent(String studentid);
}
