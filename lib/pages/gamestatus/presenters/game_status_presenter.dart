import 'package:fonovoo/application/usacases/grade/factories/make_load_grades_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';
import 'package:fonovoo/pages/schools/presenters/schools_list_presenter.dart';

class GameStatusPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/game-status-page";

  List<StudentsCategoryDto> studentsCategoryDto = [];
  late UseCase loadStudentsCategoryUsecase;

  late Command loadGradesCommand;

  GameStatusPresenter({required super.pageContext}) {
    loadStudentsCategoryUsecase = makeLoadGradesUsecaseFactory;
    loadGradesCommand = Command0(loadStudentsCategory)..execute();
  }

  Future<void> loadStudentsCategory() async {
    try {
      List<StudentsCategoryEntity>? studentsCategoryEntity =
          await loadStudentsCategoryUsecase.execute(null)
              as List<StudentsCategoryEntity>?;

      if (studentsCategoryEntity == null) {
        return;
      }

      for (var cat in studentsCategoryEntity) {
        studentsCategoryDto.add(
          StudentsCategoryDto(
            cat.getId(),
            cat.getStudentId(),
            cat.getStudentName(),
            cat.getCategoryId(),
            cat.getCategoryName(),
            cat.getGrade(),
          ),
        );
      }
    } catch (e) {
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> goToSchoolsPage() async {
    try {
      navigate(SchoolsListPresenter.pageName, null, super.pageContext);
    } catch (e) {
      return;
    }
  }
}
