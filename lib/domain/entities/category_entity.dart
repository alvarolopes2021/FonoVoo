import 'package:fonovoo/domain/domain_services/get_categories_explanation_.dart';

class CategoryEntity {
  String _id = "";
  String _color = "";
  String _name = "";

  CategoryEntity(String id, String name, String color) {
    _id = id;
    _name = name;
    _color = color;
  }

  static CategoryEntity create(String id, String name, String color) {
    return CategoryEntity(id, name, color);
  }

  String getId() {
    return _id;
  }

  void setId(String id) {
    _id = id;
  }

  String getName() {
    return _name;
  }

  void updateName(String name) {
    _name = name;
  }

  String getColor() {
    return _color;
  }

  void updateColor(String id) {
    _color = id;
  }

  String getCategoryExpalanation() {
    return GetCategoryExpalanation.categoryToExplanation(_name);
  }
}
