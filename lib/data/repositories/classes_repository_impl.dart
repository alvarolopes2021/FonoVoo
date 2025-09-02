import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/iclasses_repository.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class ClassesRepositoryImpl implements IClassesRepository {
  late Isqldatabase database;

  ClassesRepositoryImpl() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> addClass(ClassroomEntity? classe) async {
    try {
      if (classe == null) {
        return false;
      }

      String sql =
          "INSERT INTO classrooms (classroomid, classroomname, schoolid) VALUES ('${classe.getId()}', '${classe.getName()}', '${classe.getSchoolId()}')";

      await database.writeData(sql);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<ClassroomEntity>> listClassrooms() async {
    List<ClassroomEntity> classrooms = [];
    try {
      String sql = "SELECT * FROM classrooms";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;
      for (var element in data) {
        classrooms.add(
          ClassroomEntity.create(
            element["classroomid"].toString(),
            element["classroomname"].toString(),
            element["schoolid"].toString(),
          ),
        );
      }

      return classrooms;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> deleteClass(ClassroomEntity? classe) async {
    try {
      if (classe == null) {
        return false;
      }

      String sql =
          "DELETE FROM classrooms WHERE classroomid = '${classe.getId()}';";

      bool res = await database.writeData(sql);

      return res;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> editClass(ClassroomEntity classe) async {
    try {
      String sql =
          "UPDATE classrooms SET classroomname = '${classe.getName()}' WHERE classroomid = '${classe.getId()}';";

      return await database.writeData(sql);
    } catch (e) {
      return false;
    }
  }
}
