import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/ids/factories/make_id_service_factory.dart';
import 'package:fonovoo/data/ids/iuuid.dart';

abstract class BaseMigrations {
  late Isqldatabase database;

  IIdService idService = makeIdServiceFactory;

  BaseMigrations(Isqldatabase db) {
    database = db;
  }

  run();
}
