import 'package:fonovoo/data/repositories/groups_repository_impl.dart';
import 'package:fonovoo/data/repositories/igroups_repository.dart';

IgroupsRepository get makeGroupsRepositoryFactory => GroupsRepositoryImpl();
