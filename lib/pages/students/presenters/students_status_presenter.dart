import 'package:fonovoo/application/usacases/grade/factories/make_load_grades_by_students_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/students_category_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/students_category_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/load_data_command.dart';

class StudentsStatusPresenter extends BasePresenter {
  static String pageName = "/students-status";

  late StudentsDto selectedStudent;
  List<StudentsCategoryDto> studentsCategoryDto = [];
  late UseCase loadStudentsCategoryUsecase;

  late Command loadGradesCommand;

  StudentsStatusPresenter({required super.pageContext}) {
    loadStudentsCategoryUsecase = makeLoadGradesByStudentUsecaseFactory;
  }

  void updateDto(Object? data) {
    if (data == null) {
      return;
    }

    selectedStudent = data as StudentsDto;

    loadGradesCommand = Command0(loadStudentsCategory)..execute();
  }

  Future<void> loadStudentsCategory() async {
    try {
      List<StudentsCategoryEntity>? studentsCategoryEntity =
          await loadStudentsCategoryUsecase.execute(selectedStudent.getId())
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
            cat.getCategoryColor(),
            cat.getMatchId(),
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
