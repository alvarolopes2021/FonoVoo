import 'package:fonovoo/application/usacases/grade/factories/make_load_grades_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class GameStatusPresenter extends BasePresenter {
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
            cat.getCategoryId(),
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
}
