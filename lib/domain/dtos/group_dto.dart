import 'package:fonovoo/domain/entities/group_entity.dart';

class GroupDto {
  String _id = "";
  String _name = "";

  GroupDto(String id, String name) {
    _id = id;
    _name = id;
  }

  groupDtoMapping(GroupEntity? groupEntity) {
    if (groupEntity == null) {
      return GroupDto("", "");
    }
    _id = groupEntity.getId();
    _name = groupEntity.getName();
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
