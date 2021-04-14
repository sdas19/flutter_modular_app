import 'package:persistence_component/persistence_component.dart';
import 'package:persistence_component_impl/helper/persistence_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceComponentImpl implements SharedPrefComponent {

  @override
  Future<SharedPreferences> prefs = PersistenceHelper.getOrCreatePrefs();

}