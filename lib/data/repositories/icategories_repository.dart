import 'package:fonovoo/domain/entities/category_entity.dart';

abstract class IcategoriesRepository {
  Future<List<CategoryEntity>?> listCategories();
}
