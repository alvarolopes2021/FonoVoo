import 'package:fonovoo/domain/entities/group_entity.dart';

abstract class IgroupsRepository {
  Future<bool> addGroup(GroupEntity classe);
  Future<List<GroupEntity>> listGroups(String classid);
}
