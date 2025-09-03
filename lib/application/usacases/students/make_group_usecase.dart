import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_groups_repository_factory.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';

class MakeGroupUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    GroupDto? groupDto = param as GroupDto?;

    if (groupDto == null) {
      return null;
    }

    GroupEntity groupEntity = GroupEntity.create(
      groupDto.getId(),
      groupDto.getName(),
      groupDto.getClassId(),
    );

    bool res = await makeGroupsRepositoryFactory.addGroup(groupEntity);

    if (res) {
      return groupDto;
    }
  }
}
