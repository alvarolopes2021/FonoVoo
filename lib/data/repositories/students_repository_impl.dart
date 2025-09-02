import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/istudents_repository.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsRepositoryImpl implements IstudentsRepository {
  late Isqldatabase database;

  StudentsRepositoryImpl() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> addStudent(StudentsEntity? student) async {
    try {
      if (student == null) {
        return false;
      }

      String sql =
          "INSERT INTO students (studentid, classid, name, groupid) VALUES ('${student.getId()}', '${student.getClassId()}', '${student.getName()}', '${student.getGroupId()}');";

      return await database.writeData(sql);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<StudentsEntity>> listStudentsByClass(String classid) async {
    List<StudentsEntity> students = [];
    try {
      String sql = "SELECT * FROM students WHERE classid = '$classid';";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;
      for (var element in data) {
        students.add(
          StudentsEntity.create(
            element["studentid"].toString(),
            element["name"].toString(),
            element["classid"].toString(),
            element["groupid"].toString(),
          ),
        );
      }

      return students;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> editStudent(StudentsEntity student) async {
    try {
      String sql =
          "UPDATE students SET name = '${student.getName()}' WHERE classid = '${student.getClassId()}' AND studentid = '${student.getId()}';";

      return await database.writeData(sql);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteStudent(StudentsEntity student) async {
    try {
      String sql =
          "DELETE FROM students WHERE classid = '${student.getClassId()}' AND studentid = '${student.getId()}';";

      bool res = await database.writeData(sql);
      if (res) return true;

      return false;
    } catch (e) {
      return false;
    }
  }
}
