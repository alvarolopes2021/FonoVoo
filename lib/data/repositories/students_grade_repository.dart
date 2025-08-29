import 'package:fonovoo/data/repositories/istudents_grade_repository.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';

class StudentsGradeRepository implements IStudentsGradeRepository {
  List<StudentsCategoryEntity> grades = [
    StudentsCategoryEntity("2", "2", "Danilo", "1", "frases", 3),
    StudentsCategoryEntity("2", "2", "Danilo", "1", "frases", 3),
    StudentsCategoryEntity("3", "2", "Danilo", "3", "parlendas", 4),
    StudentsCategoryEntity("4", "1", "Dias", "3", "parlendas", 1),
    StudentsCategoryEntity("5", "1", "Dias", "4", "silabas", 5),
    StudentsCategoryEntity("6", "1", "Dias", "4", "silabas", 4),
    StudentsCategoryEntity("7", "1", "Dias", "1", "frases", 4),
    StudentsCategoryEntity("8", "3", "Benito", "1", "frases", 4),
    StudentsCategoryEntity("8", "4", "Benito", "1", "frases", 4),
    StudentsCategoryEntity("8", "4", "Benito", "1", "frases", 4),
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
