import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl.dart';
import 'package:product_launcher/product_launcher.dart';

class ProductLauncherImpl implements ProductLauncher {
  @override
  LoginManager getLoginManager() {
    return LoginManagerImpl();
  }
}
