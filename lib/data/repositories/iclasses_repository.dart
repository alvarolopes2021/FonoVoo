import 'package:fonovoo/domain/entities/classroom_entity.dart';

abstract class IClassesRepository {
  Future<bool> addClass(ClassroomEntity classe);
  Future<List<ClassroomEntity>> listClassrooms();
}
