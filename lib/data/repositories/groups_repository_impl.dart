import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/igroups_repository.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';

class GroupsRepositoryImpl implements IgroupsRepository {
  late Isqldatabase database;

  GroupsRepositoryImpl() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> addGroup(GroupEntity group) async {
    try {
      if (group == null) {
        return false;
      }

      String sql =
          "INSERT INTO groups (groupid, classroomid, groupname) VALUES ('${group.getId()}', '${group.getClassId()}', '${group.getName()}');";

      await database.writeData(sql);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<GroupEntity>> listGroups(String classid) async {
    List<GroupEntity> groups = [];
    try {
      String sql = "SELECT * FROM groups WHERE classroomid = '$classid';";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;
      for (var element in data) {
        groups.add(
          GroupEntity.create(
            element["groupid"].toString(),
            element["groupname"].toString(),
            element["classroomid"].toString(),
          ),
        );
      }

      return groups;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> deleteGroup(GroupEntity group) async {
    try {
      if (group == null) {
        return false;
      }

      String sql =
          "DELETE FROM groups WHERE groupid = '${group.getId()}';";

      bool res = await database.writeData(sql);

      return res;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> editGroup(GroupEntity group) async {
    // TODO: implement editGroup
    throw UnimplementedError();
  }
}
