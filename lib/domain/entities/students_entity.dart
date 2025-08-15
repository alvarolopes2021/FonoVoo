class StudentsEntity {
  String _id = "";
  String _name = "";
  String? _classid = "";
  String? _groupid = "";

  StudentsEntity(String id, String name, String? classId, String? groupId) {
    _id = id;
    _name = name;
    _classid = classId;
    _groupid = groupId;
  }

  static StudentsEntity create(String id, String name, String? classId, String? groupId) {    
    return StudentsEntity(id, name, classId, groupId);
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
  
  String? getGroupId() {
    return _groupid;
  }

  void updateGroupId(String id){
    _groupid = id;
  }
}
