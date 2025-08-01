import 'package:fonovoo/data/repositories/ischools_repository.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';

class SchoolsRepositoryImpl implements IschoolsRepository {
  @override
  Future<bool> addSchool(SchoolEntity school) {
    // TODO: implement addSchool
    throw UnimplementedError();
  }

  @override
  Future<List<SchoolEntity>?>? loadSchools() async {
    List<SchoolEntity> schools = [
      SchoolEntity("id", "CIEM de Fátima"),
      SchoolEntity("id", "Colégio São José"),
      SchoolEntity("id", "Objetivo"),
    ];
    return schools;
  }
}
