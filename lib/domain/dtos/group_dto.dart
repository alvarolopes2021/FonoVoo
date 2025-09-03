import 'package:fonovoo/domain/entities/group_entity.dart';

class GroupDto {
  String _id = "";
  String _name = "";
  String? _classid = "";
  bool isSelected = false;

  GroupDto(String id, String name, String? classId) {
    _id = id;
    _name = name;
    _classid = classId;
  }

  groupDtoMapping(GroupEntity? groupEntity) {
    if (groupEntity == null) {
      return GroupDto("", "", "");
    }
    _id = groupEntity.getId();
    _name = groupEntity.getName();
    _classid = groupEntity.getClassId();
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

  String? getClassId() {
    return _classid;
  }

  void setClassId(String id) {
    _classid = id;
  }
}
