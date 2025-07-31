class GroupEntity {
  String _id = "";
  String? _classid = "";
  String _name = "";

  GroupEntity(String id, String name, String? classId) {
    _id = id;
    _name = name;
    _classid = classId;
  }

  static GroupEntity create(String id, String name, String? classId) {    
    return GroupEntity(id, name, classId);
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

  void updateName(String name){
    _name = name;
  }

  String? getClassId() {
    return _classid;
  }

  void updateClassId(String id){
    _classid = id;
  }
}
