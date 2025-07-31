class ClassEntity {
  String _id = "";
  String _name = "";

  ClassEntity(String id, String name) {
    _id = id;
    _name = name;
  }

  static ClassEntity create(String id, String name) {    
    return ClassEntity(id, name);
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
