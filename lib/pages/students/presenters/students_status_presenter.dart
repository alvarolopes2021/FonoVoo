import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class StudentsStatusPresenter extends BasePresenter {
  static String pageName = "/students-status";

  late StudentsDto selectedStudent;

  StudentsStatusPresenter({required super.pageContext});

  void updateDto(Object? student) {
    if (student == null) {
      return;
    }

    selectedStudent = student as StudentsDto;
  }
}
