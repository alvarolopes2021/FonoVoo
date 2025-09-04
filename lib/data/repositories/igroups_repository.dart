import 'package:fonovoo/domain/entities/group_entity.dart';

abstract class IgroupsRepository {
  Future<bool> addGroup(GroupEntity group);
  Future<List<GroupEntity>> listGroups(String classid);
  Future<bool> deleteGroup(GroupEntity group);
  Future<bool> editGroup(GroupEntity group);
}
