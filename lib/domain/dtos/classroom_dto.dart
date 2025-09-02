import 'package:fonovoo/domain/entities/classroom_entity.dart';

class ClassroomDto {
  String _id = "";
  String _schoolId = "";
  String _name = "";

  ClassroomDto();

  classroomDtoMapping(ClassroomEntity? classroomEntity) {
    if (classroomEntity == null) {
      return ClassroomDto();
    }
    _id = classroomEntity.getId();
    _name = classroomEntity.getName();
    _schoolId = classroomEntity.getSchoolId();
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

  String getSchoolId() {
    return _schoolId;
  }

  void updateSchoolId(String id) {
    _schoolId = id;
  }
}
