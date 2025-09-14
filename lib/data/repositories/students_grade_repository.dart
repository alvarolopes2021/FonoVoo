import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/istudents_grade_repository.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';

class StudentsGradeRepository implements IStudentsGradeRepository {
  late Isqldatabase database;

  StudentsGradeRepository() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> addGradeToStudent(
    StudentsCategoryEntity? studentsCategoryEntity,
  ) async {
    try {
      if (studentsCategoryEntity == null) {
        return false;
      }

      String sql =
          "INSERT INTO categories_grade (categorygradeid, studentid, categoryid, grade, matchid) VALUES ('${studentsCategoryEntity.getId()}', '${studentsCategoryEntity.getStudentId()}', '${studentsCategoryEntity.getCategoryId()}', '${studentsCategoryEntity.getGrade()}', '${studentsCategoryEntity.getMatchId()}');";

      database.writeData(sql);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<StudentsCategoryEntity>?> loadGradesByMatch(
    String matchid,
  ) async {
    try {
      String sql =
          "SELECT cg.categorygradeid as categoryid, cg.studentid as studentid, cg.categoryid as categoryid, cg.grade as grade, cg.matchid as matchid, s.name as studentname, cat.categoryname as categoryname, cat.categorycolor categorycolor FROM categories_grade cg INNER JOIN students s ON s.studentid = cg.studentid INNER JOIN categories cat ON cat.categoryid = cg.categoryid WHERE cg.matchid = '$matchid';";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;

      List<StudentsCategoryEntity> grades = [];

      for (var element in data) {
        grades.add(
          StudentsCategoryEntity.create(
            element["categorygradeid"].toString(),
            element["studentid"].toString(),
            element["studentname"].toString(),
            element["categoryid"].toString(),
            element["categoryname"].toString(),
            element["categorycolor"].toString(),
            element["matchid"].toString(),
            double.parse(element["grade"].toString()),
          ),
        );
      }

      return grades;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<StudentsCategoryEntity>?> loadGradesByStudent(
    String studentid,
  ) async {
    try {
      String sql =
          "SELECT cg.categorygradeid as categoryid, cg.studentid as studentid, cg.categoryid as categoryid, cg.grade as grade, cg.matchid as matchid, s.name as studentname, cat.categoryname as categoryname, cat.categorycolor categorycolor FROM categories_grade cg INNER JOIN students s ON s.studentid = cg.studentid INNER JOIN categories cat ON cat.categoryid = cg.categoryid WHERE s.studentid = '$studentid';";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;

      List<StudentsCategoryEntity> grades = [];

      for (var element in data) {
        grades.add(
          StudentsCategoryEntity.create(
            element["categorygradeid"].toString(),
            element["studentid"].toString(),
            element["studentname"].toString(),
            element["categoryid"].toString(),
            element["categoryname"].toString(),
            element["categorycolor"].toString(),
            element["matchid"].toString(),
            double.parse(element["grade"].toString()),
          ),
        );
      }

      return grades;
    } catch (e) {
      return null;
    }
  }
}
