import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_groups_repository_factory.dart';
import 'package:fonovoo/domain/entities/group_entity.dart';

class ListGroupsUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    List<GroupEntity> res = await makeGroupsRepositoryFactory.listGroups();

    return res;
  }
}
