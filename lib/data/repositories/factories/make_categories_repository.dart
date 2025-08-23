import 'package:fonovoo/data/repositories/categories_repository.dart';
import 'package:fonovoo/data/repositories/icategories_repository.dart';

IcategoriesRepository get makeCategoriesRepositoryFactory =>
    CategoriesRepository();
