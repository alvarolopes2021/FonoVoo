class ClassroomEntity {
  String _id = "";
  String _schoolId = "";
  String _name = "";
  int _numberOfStudents = 0;

  ClassroomEntity(
    String id,
    String name,
    String schoolId,
    int numberOfStudents,
  ) {
    _id = id;
    _name = name;
    _schoolId = schoolId;
    _numberOfStudents = numberOfStudents;
  }

  static ClassroomEntity create(
    String id,
    String name,
    String schoolId,
    int numberOfStudents,
  ) {
    return ClassroomEntity(id, name, schoolId, numberOfStudents);
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

  int getNumberOfStudents() {
    return _numberOfStudents;
  }

  void updateNumberOfStudents(int numberOfStudents) {
    _numberOfStudents = numberOfStudents;
  }
}
