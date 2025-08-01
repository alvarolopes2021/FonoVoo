import 'package:fonovoo/domain/entities/school_entity.dart';

abstract class IschoolsRepository {
  Future<List<SchoolEntity>?>? loadSchools();
  Future<bool> addSchool(SchoolEntity school);
}
