import 'package:fonovoo/data/repositories/igroups_repository.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';

class GroupsRepositoryImpl implements IgroupsRepository {
  List<GroupEntity> groups = [
    GroupEntity.create("1", "Grupo 1", ""),
    GroupEntity.create("2", "Grupo 2", ""),
    GroupEntity.create("3", "Grupo 3", ""),
  ];

  @override
  Future<bool> addGroup(GroupEntity group) async {
    groups.add(group);
    return true;
  }

  @override
  Future<List<GroupEntity>> listGroups() async {
    return groups;
  }
}
