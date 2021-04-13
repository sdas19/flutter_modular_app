import 'package:get_it/get_it.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:server_login/server_login.dart';
import 'package:deps_helper/DependencyResolver.dart';
import 'package:core/core_component.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class LoginManagerImplDepsResolver implements DependencyResolver {
  LoginManagerImplDepsResolver._();

  static final LoginManagerImplDepsResolver instance =
      LoginManagerImplDepsResolver._();
  static final scopeName = 'LoginScope';

  @override
  registerFeature(CoreComponent coreComponent) {
  GetIt.instance.pushNewScope(scopeName: scopeName);
  GetIt.instance.registerLazySingleton<Future<SharedPreferences>>(
        () => coreComponent.prefs);
    GetIt.instance
        .registerLazySingleton<Future<Database>>(() => coreComponent.db);
    GetIt.instance.registerLazySingleton<Dio>(() => coreComponent.dio);
    GetIt.instance.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    GetIt.instance.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }
}
