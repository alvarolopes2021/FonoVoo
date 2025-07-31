class MatchEntity {
  String _id = "";
  String _status = "";

  MatchEntity(String id, String status) {
    _id = id;
    _status = status;
  }

  static MatchEntity create(String id, String status) {    
    return MatchEntity(id, status);
  }
  
  String getId() {
    return _id;
  }

  void setId(String id) {
    _id = id;
  }

  String getMatchStatus() {
    return _status;
  }

  void updateStatus(String status){
    _status = status;
  }
}
