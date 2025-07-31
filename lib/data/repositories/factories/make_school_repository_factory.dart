import 'package:fonovoo/data/repositories/ischools_repository.dart';
import 'package:fonovoo/data/repositories/schools_repository_impl.dart';

IschoolsRepository get makeSchoolsRepositoryFactory => SchoolsRepositoryImpl();
