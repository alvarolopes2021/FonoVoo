import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/imatch_repository.dart';
import 'package:fonovoo/domain/entities/match_entity.dart';

class MatchRepositoryImpl implements ImatchRepository {
  late Isqldatabase database;

  MatchRepositoryImpl() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<bool> editMatch(MatchEntity matchEntity) async {
    try {
      String sql =
          "UPDATE matches SET status = '${matchEntity.getMatchStatus()}' WHERE matchid = '${matchEntity.getId()}';";

      await database.writeData(sql);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<MatchEntity>> listMatches() async {
    return [];
  }

  @override
  Future<bool> startMatch(MatchEntity? matchEntity) async {
    try {
      if (matchEntity == null) {
        return false;
      }

      String sql =
          "INSERT INTO matches (matchid, status) VALUES ('${matchEntity.getId()}', '${matchEntity.getMatchStatus()}');";

      database.writeData(sql);
      return true;
    } catch (e) {
      return false;
    }
  }
}
