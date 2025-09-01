import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/ischools_repository.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';

class SchoolsRepositoryImpl implements IschoolsRepository {
  late Isqldatabase database;

  SchoolsRepositoryImpl() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> addSchool(SchoolEntity? school) async {
    try {
      if (school == null) {
        return false;
      }

      String sql =
          "INSERT INTO schools (schoolid, schoolname) VALUES ('${school.getId()}', '${school.getName()}')";

      database.writeData(sql);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<SchoolEntity>?> loadSchools() async {
    List<SchoolEntity> schools = [];
    try {
      String sql = "SELECT * FROM schools";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;
      for (var element in data) {
        schools.add(
          SchoolEntity.create(
            element["schoolid"].toString(),
            element["schoolname"].toString(),
          ),
        );
      }

      return schools;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> editSchool(SchoolEntity school) async {
    SchoolEntity schoolToEdit = [].firstWhere(
      (e) => e.getId() == school.getId(),
    );
    int index = [].indexOf(schoolToEdit);

    return true;
  }

  @override
  Future<SchoolEntity?> deleteSchool(SchoolEntity school) async {
    try {
      if (school == null) {
        return null;
      }

      String sql = "DELETE FROM schools WHERE schoolid = '${school.getId()}';";

      bool res = await database.writeData(sql);
      if (res) return school;

      return null;
    } catch (e) {
      return null;
    }
  }
}
