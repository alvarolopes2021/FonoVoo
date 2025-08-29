import 'package:fonovoo/domain/entities/match_entity.dart';

abstract class ImatchRepository {
  Future<bool> startMatch(MatchEntity matchEntity);
  Future<List<MatchEntity>> listMatches();
  Future<MatchEntity> editMatch(MatchEntity matchEntity);
}
