import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../controller/utils/constants.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), "listsDatabase");
      // deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, dbVersion) {
        db.execute(CREATE_TABLE_POKE_TEAM);
      });
    }
    return _db;
  }
}
