import 'package:fonovoo/data/repositories/icategories_repository.dart';
import 'package:fonovoo/domain/entities/category_entity.dart';

class CategoriesRepository implements IcategoriesRepository {
  List<CategoryEntity> categories = [
    CategoryEntity.create("1", "frases", "red"),
    CategoryEntity.create("2", "rimas", "green"),
    CategoryEntity.create("3", "parlendas", "blue"),
    CategoryEntity.create("4", "silabas", "yellow"),
  ];

  @override
  Future<List<CategoryEntity>> listCategories() async {
    return categories;
  }
}
