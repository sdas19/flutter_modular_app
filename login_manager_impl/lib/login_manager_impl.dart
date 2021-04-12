import 'package:get_it/get_it.dart';
import 'package:login_manager/login_manager.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';

class LoginManagerImpl implements LoginManager {
  LoginManagerImpl() {
    LoginManagerImplDepsResolver.instance.registerProduct();
  }

  @override
  String login(String username, String password) {
    return GetIt.instance.get<FirebaseLoginManager>().login(username, password);
  }
}
