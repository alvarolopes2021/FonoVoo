import 'dart:async';

import 'package:fonovoo/application/usacases/categories/factories/make_list_categories_uscase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/category_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/category_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class GamePagePresenter extends BasePresenter {
  static String pageName = "/game-page";

  late Timer _timer;

  List<CategoryDto> grid = [];
  List<StudentsDto> allStudents = [];

  late StudentsDto selectedStudent;

  Duration minutesLeft = Duration(minutes: 35, seconds: 1);

  late UseCase listCategoriesUsecase;
  late Command loadCategories;

  GamePagePresenter({required super.pageContext}) {
    listCategoriesUsecase = makeListCategoriesUscaseFactory;
    loadCategories = Command0(_loadCategories)..execute();
    _timer = Timer.periodic(const Duration(seconds: 1), handleTimeout);
  }

  void updateDto(Object? selectedGroups) {
    if (selectedGroups == null) {
      return;
    }
    Map<String, List<StudentsDto>> groups =
        selectedGroups as Map<String, List<StudentsDto>>;

    for (var element in groups.entries) {
      allStudents.addAll(element.value);
    }
  }

  void updateSelection(int index) {
    for (var cat in grid) {
      cat.isSelected = false;
    }
    grid[index].isSelected = !grid[index].isSelected;

    notifyListeners();
  }

  void _loadCategories() async {
    var categories =
        await listCategoriesUsecase.execute(null) as List<CategoryEntity>;

    if (categories.isEmpty) return;

    for (var cat in categories) {
      grid.add(CategoryDto.create(cat.getId(), cat.getName(), cat.getColor()));
    }
    notifyListeners();
  }

  void handleTimeout(Timer timer) async {
    minutesLeft -= Duration(seconds: 1);
    if (minutesLeft == Duration(minutes: 0, seconds: 0)) {
      _timer.cancel();
    }
    notifyListeners();
  }

  void selectRunningStudent(StudentsDto student) {
    selectedStudent = student;
  }

  void gotIt() {
    
  }
}
