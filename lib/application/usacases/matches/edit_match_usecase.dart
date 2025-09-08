import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_match_repository_factory.dart';
import 'package:fonovoo/domain/dtos/match_dto.dart';
import 'package:fonovoo/domain/entities/match_entity.dart';

class EditMatchUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    MatchDto? matchDto = param as MatchDto?;

    if (matchDto == null) {
      return null;
    }

    MatchEntity matchEntity = MatchEntity.create(
      matchDto.getId(),
      matchDto.getMatchStatus(),
    );

    bool res = await makeMatchRepositoryFactory.editMatch(matchEntity);

    return matchEntity;
  }
}
