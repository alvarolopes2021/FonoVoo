import 'package:fonovoo/data/repositories/iclasses_repository.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class ClassesRepositoryImpl implements IClassesRepository {
  List<ClassroomEntity> classrooms = [
    ClassroomEntity.create("1", "3º Ano A"),
    ClassroomEntity.create("2", "3º Ano C"),
    ClassroomEntity.create("3", "4º Ano A"),
    ClassroomEntity.create("4", "4º Ano B"),
  ];

  @override
  Future<bool> addClass(ClassroomEntity classe) {
    // TODO: implement addClass
    throw UnimplementedError();
  }

  @override
  Future<List<ClassroomEntity>> listClassrooms() async {
    return classrooms;
  }
}
