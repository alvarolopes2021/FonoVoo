import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsDto {
  String _id = "";
  String? _classid = "";
  String? _groupId = "";
  String _name = "";
  double _grade = 0;
  bool isSelected = false;
  bool belongsToGroup = false;

  StudentsDto();

  studentDtoMapping(StudentsEntity? studentEntity) {
    if (studentEntity == null) {
      return StudentsDto();
    }
    _id = studentEntity.getId();
    _name = studentEntity.getName();
    _classid = studentEntity.getClassId();
    _groupId = studentEntity.getGroupId();
    belongsToGroup =
        studentEntity.getGroupId() != null && studentEntity.getGroupId() != "";
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

  String? getGroupId() {
    return _groupId;
  }

  void setGroupId(String? id) {
    _groupId = id;
  }

  String? getClassId() {
    return _classid;
  }

  void updateClassId(String? id) {
    _classid = id;
  }

  void updateIsSelected(bool value) {
    isSelected = value;
  }

  void updateBelongsToGroup(bool value) {
    belongsToGroup = value;
  }

  double getGrade() {
    return _grade;
  }

  void setGrade(double grade) {
    _grade = grade;
  }
}
