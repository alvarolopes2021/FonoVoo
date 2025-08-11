import 'package:fonovoo/data/repositories/istudents_repository.dart';
import 'package:fonovoo/data/repositories/students_repository_impl.dart';

IstudentsRepository get makeStudentsRepositoryFactory =>
    StudentsRepositoryImpl();
