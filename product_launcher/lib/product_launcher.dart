import 'package:login_manager/login_manager.dart';
import 'package:home_manager/home_manager.dart';

abstract class ProductLauncher {
  LoginManager getLoginManager();
  HomeManager getHomeManager();
}