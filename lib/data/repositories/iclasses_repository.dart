import 'package:fonovoo/domain/entities/classroom_entity.dart';

abstract class IClassesRepository {
  bool addClass(ClassroomEntity classe);
}
