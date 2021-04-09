import 'package:login_manager/login_manager.dart';
import 'package:login_manager/login_manager_type.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:server_login/server_login.dart';

class LoginManagerImpl implements LoginManager {
  final LoginManagerType type;

  LoginManagerImpl({this.type});

  @override
  String login(String username, String password) {
    if(type == LoginManagerType.TYPE_FIREBASE) {
      return FirebaseLoginManager.instance.login(username, password);
    } else {
      return ServerLoginManager.instance.login(username, password);
    }
  }
}
