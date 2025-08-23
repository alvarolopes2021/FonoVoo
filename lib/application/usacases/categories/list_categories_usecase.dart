import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/data/repositories/factories/make_categories_repository.dart';

class ListCategoriesUsecase implements UseCase {
  @override
  Future<Object?> execute(Object? param) async {
    try {
      return makeCategoriesRepositoryFactory.listCategories();
    } catch (e) {
      return null;
    }
  }
}
