import 'package:fonovoo/data/repositories/imatch_repository.dart';
import 'package:fonovoo/domain/entities/match_entity.dart';
import 'package:fonovoo/domain/enums/match_status.dart';

class MatchRepositoryImpl implements ImatchRepository {
  List<MatchEntity> matches = [
    MatchEntity("1", MatchStatus.Running),
    MatchEntity("2", MatchStatus.Finished),
  ];
  @override
  Future<MatchEntity> editMatch(MatchEntity matchEntity) {
    // TODO: implement editMatch
    throw UnimplementedError();
  }

  @override
  Future<List<MatchEntity>> listMatches() async {
    return matches;
  }

  @override
  Future<bool> startMatch(MatchEntity matchEntity) async {
    matches.add(matchEntity);
    return true;
  }
}
