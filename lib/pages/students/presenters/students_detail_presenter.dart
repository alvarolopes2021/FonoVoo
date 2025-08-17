import 'package:fonovoo/application/usacases/students/edit_student_usecase.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

import 'package:fonovoo/application/usacases/students/factories/make_add_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class StudentsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-detail/:data";

  late StudentsDto? studentsDto;

  bool newStudent = false;

  late UseCase addStudentUseCase;
  late UseCase editStudentUsecase;

  StudentsDetailPresenter({required super.pageContext}) {
    addStudentUseCase = makeAddStudentUsecaseFactory;
    editStudentUsecase = makeEditStudentUsecaseFactory;
  }

  void updateDto(Object? student) {
    studentsDto = student as StudentsDto?;

    if (studentsDto == null) {
      studentsDto = StudentsDto();
      newStudent = true;
      return;
    }
  }

  Future<List<StudentsDto>?> addStudent() async {
    try {
      StudentsDto? newStudent =
          await addStudentUseCase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, newStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<StudentsEntity>?> editStudent() async {
    try {
      StudentsDto? editedStudent =
          await editStudentUsecase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, editedStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }
}
