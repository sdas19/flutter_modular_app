import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PersistenceHelper {
  static var prefs;
  static var db;

  static Future<SharedPreferences> getOrCreatePrefs() {
    if (prefs == null) {
      prefs = SharedPreferences.getInstance();
    }
    return prefs;
  }

  static Future<Database> getOrCreateDB() async {
    if (db == null) {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'demo.db');
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            // When creating the db, create the table
            await db.execute(
                'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
          });
    }
    return db;
  }
}