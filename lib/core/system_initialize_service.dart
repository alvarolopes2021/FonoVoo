import 'package:fonovoo/core/factories/make_logs_factory.dart';
import 'package:fonovoo/data/database/factories/make_sql_database_factory.dart';

class SystemInitializeService {
  static initilizeSqlDb() async {
    try {
      makeSqlDatabaseFactory.open();
      makeLogService.writeErrorMessage("OPENED DATABASE");
    } catch (e) {
      makeLogService.writeErrorMessage(e.toString());
    }
  }
}
