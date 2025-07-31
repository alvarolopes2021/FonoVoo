import 'package:fonovoo/domain/entities/school_entity.dart';

abstract class IschoolsRepository {
  Future<bool> addSchool(SchoolEntity school);
}
