import 'package:get_it/get_it.dart';
import 'package:deps_helper/dependency_resolver.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class HomeManagerImplDepsResolver implements LocalPersistanceDependencyResolver {
  HomeManagerImplDepsResolver._();

  static final HomeManagerImplDepsResolver instance =
      HomeManagerImplDepsResolver._();
  static final scopeName = 'HomeScope';

  pushNewScope() {
    GetIt.instance.pushNewScope(scopeName: scopeName);
  }

  @override
  registerLocalPersistenceComponent(LocalPersistenceComponent localPersistenceComponent) {
    GetIt.instance.registerLazySingleton<Future<SharedPreferences>>(
            () => localPersistenceComponent.prefs);
    GetIt.instance
        .registerLazySingleton<Future<Database>>(() => localPersistenceComponent.db);
  }
}
