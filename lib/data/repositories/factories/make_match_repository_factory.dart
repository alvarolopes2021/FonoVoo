import 'package:fonovoo/data/repositories/imatch_repository.dart';
import 'package:fonovoo/data/repositories/match_repository_impl.dart';

ImatchRepository get makeMatchRepositoryFactory => MatchRepositoryImpl();
