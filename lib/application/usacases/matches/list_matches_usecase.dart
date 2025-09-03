import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_groups_repository_factory.dart';

class ListMatchesUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeGroupsRepositoryFactory.listGroups(param.toString());
    } catch (e) {
      return null;
    }
  }
}
