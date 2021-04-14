import 'package:login_manager/login_manager.dart';
import 'package:home_manager/home_manager.dart';
import 'package:navigation/navigation_service.dart';

abstract class ProductLauncher {
  NavigationService getNavigationService();
  LoginManager getLoginManager();
  HomeManager getHomeManager();
}