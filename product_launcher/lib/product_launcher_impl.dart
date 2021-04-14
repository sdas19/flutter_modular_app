import 'package:home_manager/home_manager.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl.dart';
import 'package:persistence_component_impl/local_persistence_impl.dart';
import 'package:persistence_component_impl/sharedpref_impl.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:get_it/get_it.dart';
import 'package:home_manager_impl/home_manager_impl.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:network_component_impl/network_component_impl.dart';

class ProductLauncherImpl implements ProductLauncher {
  HomeManager homeManager;
  LoginManager loginManager;

  ProductLauncherImpl() {
    registerProductDependencies();
  }

  @override
  LoginManager getLoginManager() {
    if (loginManager == null) {
      loginManager = LoginManagerImpl(
          sharedPrefComponent: GetIt.instance.get<SharedPrefComponent>(),
          networkComponent: GetIt.instance.get<NetworkComponent>());
    }
    return loginManager;
  }

  @override
  HomeManager getHomeManager() {
    if (homeManager == null) {
      homeManager = HomeManagerImpl(
        localPersistenceComponent:
            GetIt.instance.get<LocalPersistenceComponent>(),
      );
    }
    return homeManager;
  }

  void registerProductDependencies() {
    GetIt.instance
        .registerLazySingleton<NetworkComponent>(() => NetworkComponentImpl());
    GetIt.instance.registerLazySingleton<SharedPrefComponent>(
        () => SharedPreferenceComponentImpl());
    GetIt.instance.registerLazySingleton<LocalPersistenceComponent>(
        () => LocalPersistenceComponentImpl());
  }
}
