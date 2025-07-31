import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/database/sqlite_impl.dart';

Isqldatabase get makeSqlDatabaseFactory => SqliteImpl();