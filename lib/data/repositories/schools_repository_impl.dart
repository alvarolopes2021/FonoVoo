import 'package:fonovoo/data/repositories/ischools_repository.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';

class SchoolsRepositoryImpl implements IschoolsRepository {
  List<SchoolEntity> schools = [
    SchoolEntity("id", "CIEM de Fátima"),
    SchoolEntity("id", "Colégio São José"),
    SchoolEntity("id", "Objetivo"),
  ];

  @override
  Future<bool> addSchool(SchoolEntity school) async {
    try {
      schools.add(school);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<SchoolEntity>?>? loadSchools() async {
    await Future.delayed(Duration(seconds: 2));
    return schools;
  }
}
