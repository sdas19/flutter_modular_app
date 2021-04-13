import 'dart:math';
import 'package:path/path.dart';
import 'package:core/core_component.dart';
import 'package:core/core_component_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class CoreComponentProviderImpl implements CoreComponentProvider {
  var prefs;
  var dio;
  var db;

  @override
  CoreComponent provideCoreComponent() {
    return CoreComponent(
        prefs: _getOrCreatePrefs(),
        dio: _getOrCreateDio(),
        db: _getOrCreateDB());
  }

  Future<SharedPreferences> _getOrCreatePrefs() {
    if (prefs == null) {
      prefs = SharedPreferences.getInstance();
    }
    return prefs;
  }

  Dio _getOrCreateDio() {
    if (dio == null) {
      var options = BaseOptions(
          baseUrl: 'https://stg.gopayapi.com',
          connectTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'content-Type': 'application/json',
            'authorization': 'Bearer ${_generateToken()}'
          });
      dio = Dio(options);
    }
    return dio;
  }

  Future<Database> _getOrCreateDB() async {
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

  String _generateToken() => Random().nextDouble().toString();
}
