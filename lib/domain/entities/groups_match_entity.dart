class GroupsMatchEntity {
  String _id = "";
  String _matchid = "";
  String _groupid = "";
  String _groupname = "";
  double _grade = 0;

  GroupsMatchEntity(
    String id,
    String matchid,
    String groupid,
    String groupname,
    String categoryName,
    double grade,
  ) {
    _id = id;
    _matchid = matchid;
    _groupid = groupid;
    _groupname = groupname;
    _grade = grade;
  }

  static GroupsMatchEntity create(
    String id,
    String matchid,
    String groupid,
    String groupname,
    String categoryName,
    double grade,
  ) {
    return GroupsMatchEntity(
      id,
      matchid,
      groupid,
      groupname,
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
    return _matchid;
  }

  void setStudentId(String id) {
    _matchid = id;
  }

  String getStudentName() {
    return _groupid;
  }

  void setStudentName(String name) {
    _groupid = name;
  }

  String getCategoryId() {
    return _groupname;
  }

  void setCategoryId(String id) {
    _groupname = id;
  }

  double getGrade() {
    return _grade;
  }

  void setGrade(double grade) {
    _grade = grade;
  }
}
