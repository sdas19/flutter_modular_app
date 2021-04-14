import 'package:get_it/get_it.dart';
import 'package:deps_helper/dependency_resolver.dart';
import 'package:navigation/navigation_service.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class HomeManagerImplDepsResolver
    implements
        LocalPersistanceDependencyResolver,
        NavigationDependencyResolver {
  HomeManagerImplDepsResolver._();

  static final HomeManagerImplDepsResolver instance =
      HomeManagerImplDepsResolver._();
  static final getIt = GetIt.asNewInstance();

  clearDependencyGraph() {
    getIt.reset();
  }

  @override
  registerLocalPersistenceComponent(
      LocalPersistenceComponent localPersistenceComponent) {
    getIt.registerLazySingleton<Future<SharedPreferences>>(
        () => localPersistenceComponent.prefs);
    getIt.registerLazySingleton<Future<Database>>(
        () => localPersistenceComponent.db);
  }

  @override
  registerNavigationService(NavigationService navigationService) {
    getIt.registerLazySingleton<NavigationService>(() => navigationService);
  }
}
