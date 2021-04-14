import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class SharedPrefComponent {
  Future<SharedPreferences> prefs;
}

abstract class LocalPersistenceComponent extends SharedPrefComponent {
  Future<Database> db;
}