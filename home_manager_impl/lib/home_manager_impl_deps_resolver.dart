import 'package:app_structure/product_structure.dart';
import 'package:get_it/get_it.dart';
import 'package:deps_helper/dependency_resolver.dart';
import 'package:navigation/navigation_service.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class HomeManagerImplDepsResolver
    implements
        LocalPersistanceDependencyResolver,
        NavigationDependencyResolver,
        FeatureProviderDependencyResolver {
  HomeManagerImplDepsResolver._();

  static final HomeManagerImplDepsResolver instance =
      HomeManagerImplDepsResolver._();
  static final homeGetIt = GetIt.I<GetIt>(instanceName:'HomeGetIt');

  clearDependencyGraph() {
    homeGetIt.reset();
  }

  @override
  registerLocalPersistenceComponent(
      LocalPersistenceComponent localPersistenceComponent) {
    homeGetIt.registerLazySingleton<Future<SharedPreferences>>(
        () => localPersistenceComponent.prefs);
    homeGetIt.registerLazySingleton<Future<Database>>(
        () => localPersistenceComponent.db);
  }

  @override
  registerNavigationService(NavigationService navigationService) {
    homeGetIt.registerLazySingleton<NavigationService>(() => navigationService);
  }

  @override
  registerFeatureProvider(FeatureProvider featureProvider) {
    homeGetIt.registerLazySingleton<FeatureProvider>(() => featureProvider);
  }
}
