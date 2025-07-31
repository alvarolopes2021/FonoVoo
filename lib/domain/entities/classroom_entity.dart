class ClassroomEntity {
  String _id = "";
  String _name = "";

  ClassroomEntity(String id, String name) {
    _id = id;
    _name = name;
  }

  static ClassroomEntity create(String id, String name) {
    return ClassroomEntity(id, name);
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
