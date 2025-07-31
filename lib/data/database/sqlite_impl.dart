import 'package:fonovoo/data/database/isqldatabase.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteImpl implements Isqldatabase {
  static Database? db;
  
  @override
  Future<bool> writeData(params) {
    // TODO: implement writeData
    throw UnimplementedError();
  }

  @override
  Future<Object>? readData(params) {
    // TODO: implement readData
    throw UnimplementedError();
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
  Future<bool> open() async {
    try {
      await openDatabase(join(await getDatabasesPath(), 'fonovoo.db'), version: 1);
      return true;
    } catch (e) {
      return false;
    }
  }
}
