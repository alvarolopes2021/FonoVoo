import 'package:fonovoo/application/usacases/classes/factories/make_classrooms_usecase_factory.dart';
import 'package:fonovoo/application/usacases/classes/factories/make_delete_classroom_usecase_factory.dart';
import 'package:fonovoo/application/usacases/classes/factories/make_edit_classroom_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/domain/dtos/classroom_dto.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_presenter.dart';
import 'package:fonovoo/pages/navigation/navigation_mixin.dart';

class ClassroomDetailPresenter extends BasePresenter with NavigationMixin {
  static String pageName = "/classroom-detail";

  late ClassroomEntity? classroomEntity;
  ClassroomDto classroomDto = ClassroomDto();

  late SchoolEntity? schoolEntity;

  late UseCase addSchoolUseCase;
  late UseCase editClassroomUsecase;
  late UseCase deleteClassroomUsecase;

  ClassroomDetailPresenter({required super.pageContext}) {
    addSchoolUseCase = makeAddClassroomsUsecaseFactory;
    editClassroomUsecase = makeEditClassroomUsecaseFactory;
    deleteClassroomUsecase = makeDeleteClassroomUsecaseFactory;
  }

  void updateDto(Object? data) {
    Map<String, Object?> arguments = data as Map<String, Object?>;

    classroomEntity = arguments["classroom"] as ClassroomEntity?;
    schoolEntity = arguments["school"] as SchoolEntity?;

    if (classroomEntity == null) {
      return;
    }

    classroomDto.setId(classroomEntity!.getId());
    classroomDto.updateName(classroomEntity!.getName());
    classroomDto.updateSchoolId(classroomEntity!.getSchoolId());
  }

  Future<List<ClassroomEntity>?> addClassroom() async {
    try {
      if (schoolEntity == null) {
        return null;
      }

      classroomDto.updateSchoolId(schoolEntity!.getId());

      ClassroomEntity? newClassroom =
          await addSchoolUseCase.execute(classroomDto) as ClassroomEntity?;
      pop(pageContext, newClassroom);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<ClassroomEntity>?> editClassrrom() async {
    try {
      ClassroomEntity? editedClassroom =
          await editClassroomUsecase.execute(classroomDto) as ClassroomEntity?;
      pop(pageContext, editedClassroom);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<List<ClassroomEntity>?> deleteClassrrom() async {
    try {
      await deleteClassroomUsecase.execute(classroomDto);

      pop(pageContext, null);
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }
}
