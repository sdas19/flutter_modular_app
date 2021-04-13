import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:core/core_component_provider_impl.dart';
import 'package:core/core_component.dart';

class ProductLauncherImpl implements ProductLauncher {
  var coreComponent;

  @override
  LoginManager getLoginManager() {
    return LoginManagerImpl(coreComponent: _getOrCreateCoreComponent());
  }

  CoreComponent _getOrCreateCoreComponent() {
    if (coreComponent == null) {
      coreComponent = CoreComponentProviderImpl().provideCoreComponent();
    }
    return coreComponent;
  }
}
