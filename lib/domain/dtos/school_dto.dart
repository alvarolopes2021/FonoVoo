import 'package:fonovoo/domain/entities/school_entity.dart';

class SchoolDto {
  String _id = "";
  String _name = "";

  SchoolDto();

  schoolDtoMapping(SchoolEntity? schoolEntity) {
    if (schoolEntity == null) {
      return SchoolDto();
    }
    _id = schoolEntity.getId();
    _name = schoolEntity.getName();
  }

  String getId() {
    return _id;
  }

  void setId(String id) {
    _id = id;
  }

  String getName() {
    return _name;
  }

  void updateName(String name) {
    _name = name;
  }
}
