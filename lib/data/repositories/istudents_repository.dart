import 'package:fonovoo/domain/entities/students_entity.dart';

abstract class IstudentsRepository {
  Future<bool> addStudent(StudentsEntity student);
  Future<bool> editStudent(StudentsEntity student);
  Future<List<StudentsEntity>> listStudents();
}
