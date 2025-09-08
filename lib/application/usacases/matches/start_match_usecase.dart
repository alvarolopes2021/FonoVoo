import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/ids/factories/make_id_service_factory.dart';
import 'package:fonovoo/data/repositories/factories/make_match_repository_factory.dart';
import 'package:fonovoo/domain/dtos/match_dto.dart';
import 'package:fonovoo/domain/entities/match_entity.dart';

class StartMatchUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    MatchDto? matchDto = param as MatchDto?;

    if (matchDto == null) {
      return null;
    }

    String id = makeIdServiceFactory.generateId();

    MatchEntity? matchEntity = MatchEntity.create(
      id,
      matchDto.getMatchStatus(),
    );

    bool res = await makeMatchRepositoryFactory.startMatch(matchEntity);

    if (res) {
      return matchEntity;
    }

    return null;
  }
}
