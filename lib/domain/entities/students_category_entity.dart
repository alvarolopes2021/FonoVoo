class StudentsCategoryEntity {
  String _id = "";
  String _studentid = "";
  String _categoryid = "";
  double _grade = 0;

  StudentsCategoryEntity(
    String id,
    String studentid,
    String categoryid,
    double grade,
  ) {
    _id = id;
    _studentid = studentid;
    _categoryid = categoryid;
    _grade = grade;
  }

  static StudentsCategoryEntity create(
    String id,
    String studentid,
    String categoryid,
    double grade,
  ) {
    return StudentsCategoryEntity(id, studentid, categoryid, grade);
  }

  String getId() {
    return _id;
  }

  void setId(String id) {
    _id = id;
  }

  String getStudentId() {
    return _studentid;
  }

  void setStudentId(String id) {
    _studentid = id;
  }

  String getCategoryId() {
    return _categoryid;
  }

  void setCategoryId(String id) {
    _categoryid = id;
  }

  double getGrade() {
    return _grade;
  }

  void setGrade(double grade) {
    _grade = grade;
  }
}
