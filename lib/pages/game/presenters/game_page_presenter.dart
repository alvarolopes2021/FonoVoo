import 'dart:async';

import 'package:fonovoo/application/usacases/categories/factories/make_list_categories_uscase_factory.dart';
import 'package:fonovoo/application/usacases/grade/factories/make_add_grade_usecase_factory.dart';
import 'package:fonovoo/application/usacases/matches/factories/make_edit_match_usecase_factory.dart';
import 'package:fonovoo/application/usacases/matches/factories/make_start_match_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/core/factories/make_logs_factory.dart';
import 'package:fonovoo/domain/dtos/category_dto.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/match_dto.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/category_entity.dart';
import 'package:fonovoo/domain/entities/match_entity.dart';
import 'package:fonovoo/domain/enums/match_status.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/gamestatus/presenters/game_status_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class GamePagePresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/game-page";

  late Timer _timer;

  List<CategoryDto> grid = [];
  List<StudentsDto> allStudents = [];
  late Map<GroupDto, List<StudentsDto>> groups;

  StudentsDto? selectedStudent;
  CategoryDto? selectedCategory;

  late MatchDto match;

  Duration minutesLeft = Duration(minutes: 35, seconds: 1);

  late UseCase startMatchUsecase;
  late UseCase listCategoriesUsecase;
  late UseCase addGradeToStudentUsecase;
  late UseCase editMatchUsecase;
  late Command loadCategories;

  GamePagePresenter({required super.pageContext}) {
    listCategoriesUsecase = makeListCategoriesUscaseFactory;
    addGradeToStudentUsecase = makeAddGradeUsecaseFactory;
    startMatchUsecase = makeStartMatchUsecaseFactory;
    editMatchUsecase = makeEditMatchUsecaseFactory;
    startMatch();
    loadCategories = Command0(_loadCategories)..execute();
    _timer = Timer.periodic(const Duration(seconds: 1), handleTimeout);
  }

  void updateDto(Object? selectedGroups) {
    if (selectedGroups == null) {
      return;
    }
    allStudents = [];

    groups = selectedGroups as Map<GroupDto, List<StudentsDto>>;

    for (var element in groups.entries) {
      allStudents.addAll(element.value);
    }
  }

  Future<void> startMatch() async {
    match = MatchDto("", MatchStatus.Running);
    try {
      MatchEntity? matchEntity =
          await startMatchUsecase.execute(match) as MatchEntity?;

      if (matchEntity == null) {
        return;
      }

      match.setId(matchEntity.getId());
    } catch (e) {
      makeLogService.writeErrorMessage(e.toString());
    }
  }

  void updateSelection(int index) {
    for (var cat in grid) {
      cat.isSelected = false;
    }
    grid[index].isSelected = !grid[index].isSelected;
    selectedCategory = grid.firstWhere((cat) => cat.isSelected);

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

  void setGrade(double grade) async {
    selectedStudent ??= allStudents.first;

    if (selectedCategory == null) {
      return;
    }

    selectedStudent!.setGrade(selectedStudent!.getGrade() + grade);

    StudentsCategoryDto categoryDto = StudentsCategoryDto(
      "",
      selectedStudent!.getId(),
      selectedStudent!.getName(),
      selectedCategory!.getId(),
      selectedCategory!.getName(),
      match.getId(),
      selectedStudent!.getGrade(),
    );
    bool res = await addGradeToStudentUsecase.execute(categoryDto) as bool;

    if (res) {}
  }

  void finish() async {
    match.updateStatus(MatchStatus.Finished);

    await editMatchUsecase.execute(match);

    Map<String, Object?> parameters = {"match": match};

    await navigate(GameStatusPresenter.pageName, parameters, super.pageContext);
  }
}
