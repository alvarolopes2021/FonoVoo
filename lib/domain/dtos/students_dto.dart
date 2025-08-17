import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsDto {
  String _id = "";
  String? _groupId = "";
  String _name = "";
  bool isSelected = false;
  bool belongsToGroup = false;

  StudentsDto();

  studentDtoMapping(StudentsEntity? studentEntity) {
    if (studentEntity == null) {
      return StudentsDto();
    }
    _id = studentEntity.getId();
    _name = studentEntity.getName();
    _groupId = studentEntity.getGroupId();
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

  String? getGroupId() {
    return _groupId;
  }

  void setGroupId(String id) {
    _groupId = id;
  }

  void updateName(String name) {
    _name = name;
  }

  void updateIsSelected(bool value) {
    isSelected = value;
  }

  void updateBelongsToGroup(bool value) {
    belongsToGroup = value;
  }
}
