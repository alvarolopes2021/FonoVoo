class SchoolEntity {
  String _id = "";
  String _name = "";

  SchoolEntity(String id, String name) {
    _id = id;
    _name = name;
  }

  static SchoolEntity create(String id, String name) {    
    return SchoolEntity(id, name);
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
}
