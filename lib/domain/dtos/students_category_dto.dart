class StudentsCategoryDto {
  String _id = "";
  String _studentid = "";
  String _studentName = "";
  String _categoryid = "";
  String _categoryName = "";
  double _grade = 0;

  StudentsCategoryDto(
    String id,
    String studentid,
    String studentName,
    String categoryid,
    String categoryName,
    double grade,
  ) {
    _id = id;
    _studentid = studentid;
    _studentName = studentName;
    _categoryid = categoryid;
    _categoryName = categoryName;
    _grade = grade;
  }

  static StudentsCategoryDto create(
    String id,
    String studentid,
    String studentName,
    String categoryid,
    String categoryName,
    double grade,
  ) {
    return StudentsCategoryDto(
      id,
      studentid,
      studentName,
      categoryid,
      categoryName,
      grade,
    );
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

  String getStudentName() {
    return _studentName;
  }

  void setStudentName(String name) {
    _studentName = name;
  }

  String getCategoryId() {
    return _categoryid;
  }

  void setCategoryId(String id) {
    _categoryid = id;
  }

  String getCategoryName() {
    return _categoryName;
  }

  void setCategoryName(String name) {
    _categoryName = name;
  }

  double getGrade() {
    return _grade;
  }

  void setGrade(double grade) {
    _grade = grade;
  }
}
