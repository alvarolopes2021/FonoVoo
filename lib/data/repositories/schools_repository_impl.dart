import 'package:fonovoo/data/repositories/ischools_repository.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';

class SchoolsRepositoryImpl implements IschoolsRepository {
  List<SchoolEntity> schools = [
    SchoolEntity("1", "CIEM de Fátima"),
    SchoolEntity("2", "Colégio São José"),
    SchoolEntity("3", "Objetivo"),
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
    await Future.delayed(Duration(seconds: 10));
    return schools;
  }

  @override
  Future<bool> editSchool(SchoolEntity school) async {
    SchoolEntity schoolToEdit = schools.firstWhere(
      (e) => e.getId() == school.getId(),
    );
    int index = schools.indexOf(schoolToEdit);

    schools[index] = school;

    return true;
  }
}
