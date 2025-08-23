import 'package:fonovoo/domain/entities/category_entity.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

abstract class IcategoriesRepository {
  Future<List<CategoryEntity>> listCategories();
}
