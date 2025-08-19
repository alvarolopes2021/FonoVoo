import 'package:fonovoo/data/repositories/istudents_repository.dart';
import 'package:fonovoo/domain/entities/students_entity.dart';

class StudentsRepositoryImpl implements IstudentsRepository {
  List<StudentsEntity> students = [
    StudentsEntity.create("1", "Dias", "", "1"),
    StudentsEntity.create("2", "Danilo", "", "1"),
    StudentsEntity.create("3", "Benito", "", "2"),
    StudentsEntity.create("3", "Lima", "", "1"),
    StudentsEntity.create("3", "Fernandinho", "", "2"),
  ];

  @override
  Future<bool> addStudent(StudentsEntity student) async {
    return true;
  }

  @override
  Future<List<StudentsEntity>> listStudents() async {
    return students;
  }

  @override
  Future<bool> editStudent(StudentsEntity student) async {
    return true;
  }
}
