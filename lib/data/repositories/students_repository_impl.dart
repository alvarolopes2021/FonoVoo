import 'package:fonovoo/data/repositories/istudents_repository.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsRepositoryImpl implements IstudentsRepository {
  List<StudentsEntity> students = [
    StudentsEntity.create("1", "Dias", ""),
    StudentsEntity.create("2", "Danilo", ""),
    StudentsEntity.create("3", "Benito", ""),
  ];

  @override
  Future<bool> addStudent(StudentsEntity student) async {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<List<StudentsEntity>> listStudents() async {
    return students;
  }

  @override
  Future<bool> editStudent(StudentsEntity student) {
    // TODO: implement editStudent
    throw UnimplementedError();
  }
}
