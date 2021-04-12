import 'package:get_it/get_it.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:server_login/server_login.dart';
import 'package:deps_helper/DependencyResolver.dart';

class LoginManagerImplDepsResolver implements DependencyResolver {
  LoginManagerImplDepsResolver._();

  static final LoginManagerImplDepsResolver instance =
      LoginManagerImplDepsResolver._();

  @override
  registerProduct() {
    GetIt.instance.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    GetIt.instance.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }
}
