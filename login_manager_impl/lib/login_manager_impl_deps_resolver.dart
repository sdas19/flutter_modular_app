import 'package:app_structure/product_structure.dart';
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
        NavigationDependencyResolver,
        FeatureProviderDependencyResolver {
  LoginManagerImplDepsResolver._();

  static final LoginManagerImplDepsResolver instance =
      LoginManagerImplDepsResolver._();
  static final loginGetIt = GetIt.I<GetIt>(instanceName:'LoginGetIt');

  @override
  registerNavigationService(NavigationService navigationService) {
    loginGetIt.registerLazySingleton<NavigationService>(() => navigationService);
  }

  @override
  registerSharedPrefComponent(SharedPrefComponent sharedPrefComponent) {
    loginGetIt.registerLazySingleton<Future<SharedPreferences>>(
        () => sharedPrefComponent.prefs);
  }

  @override
  registerNetworkComponent(NetworkComponent networkComponent) {
    loginGetIt.registerLazySingleton<Dio>(() => networkComponent.dio);
  }

  @override
  registerFeatureProvider(FeatureProvider featureProvider) {
    loginGetIt.registerLazySingleton<FeatureProvider>(() => featureProvider);
  }

  registerFeatureDependencies() {
    loginGetIt.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    loginGetIt.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }

  clearDependencyGraph() {
    loginGetIt.reset();
  }
}
