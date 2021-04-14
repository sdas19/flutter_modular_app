import 'package:persistence_component/persistence_component.dart';
import 'package:persistence_component_impl/helper/persistence_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common/sqlite_api.dart';

class LocalPersistenceComponentImpl implements LocalPersistenceComponent {
  @override
  Future<Database> db = PersistenceHelper.getOrCreateDB();

  @override
  Future<SharedPreferences> prefs = PersistenceHelper.getOrCreatePrefs();

}