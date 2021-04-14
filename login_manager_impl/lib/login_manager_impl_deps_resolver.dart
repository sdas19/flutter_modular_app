import 'package:get_it/get_it.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:server_login/server_login.dart';
import 'package:deps_helper/dependency_resolver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginManagerImplDepsResolver
    implements SharedPreferenceDependencyResolver, NetworkDependencyResolver {
  LoginManagerImplDepsResolver._();

  static final LoginManagerImplDepsResolver instance =
      LoginManagerImplDepsResolver._();
  static final scopeName = 'LoginScope';

  pushLoginScope() {
    GetIt.instance.pushNewScope(scopeName: scopeName);
  }

  @override
  registerSharedPrefComponent(SharedPrefComponent sharedPrefComponent) {
    GetIt.instance.registerLazySingleton<Future<SharedPreferences>>(
        () => sharedPrefComponent.prefs);
  }

  @override
  registerNetworkComponent(NetworkComponent networkComponent) {
    GetIt.instance.registerLazySingleton<Dio>(() => networkComponent.dio);
  }

  registerFeatureDependencies() {
    GetIt.instance.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    GetIt.instance.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }
}
