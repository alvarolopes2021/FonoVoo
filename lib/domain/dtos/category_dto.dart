class CategoryDto {
  String _id = "";
  String _color = "";
  String _name = "";
  bool isSelected = false;

  CategoryDto(String id, String name, String color) {
    _id = id;
    _name = name;
    _color = color;
  }

  static CategoryDto create(String id, String name, String color) {
    return CategoryDto(id, name, color);
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
}
