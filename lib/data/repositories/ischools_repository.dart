import 'package:fonovoo/domain/entities/school_entity.dart';

abstract class IschoolsRepository {
  Future<List<SchoolEntity>?> loadSchools();
  Future<bool> addSchool(SchoolEntity school);
  Future<bool> editSchool(SchoolEntity school);
  Future<SchoolEntity?> deleteSchool(SchoolEntity school);
}
