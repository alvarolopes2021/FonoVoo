import 'package:fonovoo/data/repositories/istudents_grade_repository.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';

class StudentsGradeRepository implements IStudentsGradeRepository {
  List<StudentsCategoryEntity> grades = [
    StudentsCategoryEntity("1", "2", "3", 1),
    StudentsCategoryEntity("2", "2", "3", 3),
    StudentsCategoryEntity("3", "2", "3", 4),
    StudentsCategoryEntity("4", "1", "2", 1),
    StudentsCategoryEntity("5", "1", "1", 5),
    StudentsCategoryEntity("5", "1", "2", 4),
    StudentsCategoryEntity("5", "1", "2", 4),
  ];

  @override
  Future<bool> addGradeToStudent(
    StudentsCategoryEntity studentsCategoryEntity,
  ) async {
    return true;
  }

  @override
  Future<List<StudentsCategoryEntity>> loadGrades() async {
    return grades;
  }
}
