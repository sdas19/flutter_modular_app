import 'package:login_manager/login_manager.dart';
import 'package:login_manager/login_manager_type.dart';

abstract class ProductLauncher {
  LoginManager getLoginManager(LoginManagerType type);
}