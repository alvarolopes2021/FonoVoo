import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsDto {
  String _id = "";
  String _name = "";
  bool isSelected = false;

  StudentsDto();

  studentDtoMapping(StudentsEntity? studentEntity) {
    if (studentEntity == null) {
      return StudentsDto();
    }
    _id = studentEntity.getId();
    _name = studentEntity.getName();
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

  void updateIsSelected(bool value) {
    isSelected = value;
  }
}
