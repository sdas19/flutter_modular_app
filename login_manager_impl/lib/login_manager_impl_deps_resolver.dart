import 'package:get_it/get_it.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:navigation/navigation_service.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:server_login/server_login.dart';
import 'package:deps_helper/dependency_resolver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginManagerImplDepsResolver
    implements
        SharedPreferenceDependencyResolver,
        NetworkDependencyResolver,
        NavigationDependencyResolver {
  LoginManagerImplDepsResolver._();

  static final LoginManagerImplDepsResolver instance =
      LoginManagerImplDepsResolver._();
  static final getIt = GetIt.asNewInstance();

  @override
  registerNavigationService(NavigationService navigationService) {
    getIt.registerLazySingleton<NavigationService>(() => navigationService);
  }

  @override
  registerSharedPrefComponent(SharedPrefComponent sharedPrefComponent) {
    getIt.registerLazySingleton<Future<SharedPreferences>>(
        () => sharedPrefComponent.prefs);
  }

  @override
  registerNetworkComponent(NetworkComponent networkComponent) {
    getIt.registerLazySingleton<Dio>(() => networkComponent.dio);
  }

  registerFeatureDependencies() {
    getIt.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    getIt.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }

  clearDependencyGraph() {
    getIt.reset();
  }
}
