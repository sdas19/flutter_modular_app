import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class CoreComponent {
  final Future<SharedPreferences> prefs;
  final Future<Database> db;
  final Dio dio;

  CoreComponent({this.prefs, this.dio, this.db});
}
