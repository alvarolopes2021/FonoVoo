import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';
import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/repositories/icategories_repository.dart';
import 'package:fonovoo/domain/entities/category_entity.dart';

class CategoriesRepository implements IcategoriesRepository {
  late Isqldatabase database;

  CategoriesRepository() {
    database = makeSqlDatabaseFactory;
  }

  @override
  Future<List<CategoryEntity>?> listCategories() async {
    List<CategoryEntity> categories = [];
    try {
      String sql = "SELECT * FROM categories;";

      Object? result = await database.readData(sql);
      List<Map<String, Object?>> data = result as List<Map<String, Object?>>;

      List<CategoryEntity> grades = [];

      for (var element in data) {
        grades.add(
          CategoryEntity.create(
            element["categoryid"].toString(),
            element["categoryname"].toString(),
            element["categorycolor"].toString(),
          ),
        );
      }

      return grades;
    } catch (e) {
      return null;
    }
  }
}
