import 'package:fonovoo/core/factories/make_logs_factory.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:fonovoo/data/database/isqldatabase.dart';
import 'package:fonovoo/data/database/migrations/database_version_1.dart';

class SqliteImpl implements Isqldatabase {
  static Database? db;

  @override
  Future<bool> open() async {
    try {
      db = await openDatabase(
        join(await getDatabasesPath(), 'fonovoo.db'),
        version: 1,
        onCreate: (db, version) async {
          var db1 = DatabaseVersion1(this);
          await db1.run();
        },
        onUpgrade: (db, oldVersion, newVersion) {
          if (oldVersion == 1) {
            // We update existing table and create the new tables
          }
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> close() async {
    if (db == null) {
      return false;
    }

    try {
      await db!.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> writeData(dynamic params) async {
    if (db == null) return false;
    try {
      await db!.rawQuery(params);
      return true;
    } catch (e) {
      makeLogService.writeErrorMessage(e.toString());
      return false;
    }
  }

  @override
  Future<Object>? readData(dynamic params) async {
    if (db == null) return false;
    try {
      return db!.rawQuery(params);
    } catch (e) {
      makeLogService.writeErrorMessage(e.toString());
      return false;
    }
  }

  @override
  Future<bool> executeCommand(params) async {
    if (db == null) return false;
    try {
      db!.execute(params);
      return true;
    } catch (e) {
      makeLogService.writeErrorMessage(e.toString());
      return false;
    }
  }
}
