import 'package:fonovoo/data/repositories/istudents_grade_repository.dart';
import 'package:fonovoo/data/repositories/students_grade_repository.dart';

IStudentsGradeRepository get makeStudentsGradeRepositoryFactory =>
    StudentsGradeRepository();
