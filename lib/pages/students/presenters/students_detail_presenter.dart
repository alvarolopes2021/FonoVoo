import 'package:fonovoo/application/usacases/students/edit_student_usecase.dart';
import 'package:fonovoo/application/usacases/students/factories/make_delete_student_usecase_factory.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

import 'package:fonovoo/application/usacases/students/factories/make_add_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/students/factories/make_edit_student_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_presenter.dart';

class StudentsDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/students-detail/:data";

  late StudentsDto? studentsDto;
  late ClassroomEntity? classroomEntity;
  late SchoolEntity? schoolEntity;

  bool newStudent = false;

  late UseCase addStudentUseCase;
  late UseCase editStudentUsecase;
  late UseCase deleteStudentUsecase;

  StudentsDetailPresenter({required super.pageContext}) {
    addStudentUseCase = makeAddStudentUsecaseFactory;
    editStudentUsecase = makeEditStudentUsecaseFactory;
    deleteStudentUsecase = makeDeleteStudentUsecaseFactory;
  }

  void updateDto(Object? data) {
    Map<String, Object?> arguments = data as Map<String, Object?>;

    classroomEntity = arguments["classroom"] as ClassroomEntity?;
    schoolEntity = arguments["school"] as SchoolEntity?;
    studentsDto = arguments["student"] as StudentsDto?;

    if (studentsDto == null) {
      studentsDto = StudentsDto();
      newStudent = true;
      return;
    }
  }

  Future<List<StudentsDto>?> addStudent() async {
    try {
      if (classroomEntity == null) {
        return null;
      }

      studentsDto!.updateClassId(classroomEntity!.getId());

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
      if (classroomEntity == null) {
        return null;
      }

      studentsDto!.updateClassId(classroomEntity!.getId());

      StudentsDto? editedStudent =
          await editStudentUsecase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, editedStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<StudentsEntity>?> deleteStudent() async {
    try {
      StudentsDto? editedStudent =
          await deleteStudentUsecase.execute(studentsDto) as StudentsDto?;
      pop(pageContext, editedStudent);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }
}
