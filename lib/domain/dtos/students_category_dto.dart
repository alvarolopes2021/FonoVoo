class StudentsCategoryDto {
  String _id = "";
  String _studentid = "";
  String _studentName = "";
  String _categoryid = "";
  String _categoryName = "";
  String _categoryColor = "";
  String _matchId = "";
  double _grade = 0;

  StudentsCategoryDto(
    String id,
    String studentid,
    String studentName,
    String categoryid,
    String categoryName,
    String categoryColor,
    String matchId,
    double grade,
  ) {
    _id = id;
    _studentid = studentid;
    _studentName = studentName;
    _categoryid = categoryid;
    _categoryName = categoryName;
    _categoryColor = categoryColor;
    _matchId = matchId;
    _grade = grade;
  }

  static StudentsCategoryDto create(
    String id,
    String studentid,
    String studentName,
    String categoryid,
    String categoryName,
    String categoryColor,
    String matchId,
    double grade,
  ) {
    return StudentsCategoryDto(
      id,
      studentid,
      studentName,
      categoryid,
      categoryName,
      categoryColor,
      matchId,
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

  String getCategoryColor() {
    return _categoryColor;
  }

  void setCategoryColor(String color) {
    _categoryColor = color;
  }

  String getMatchId() {
    return _matchId;
  }

  void setMatchId(String id) {
    _matchId = id;
  }

  double getGrade() {
    return _grade;
  }

  void setGrade(double grade) {
    _grade = grade;
  }
}
