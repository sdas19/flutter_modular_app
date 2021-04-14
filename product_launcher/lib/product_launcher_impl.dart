import 'package:app_structure/feature_structure.dart';
import 'package:app_structure/product_structure.dart';
import 'package:home_manager/home_manager.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl.dart';
import 'package:navigation/navigation_service.dart';
import 'package:persistence_component_impl/local_persistence_impl.dart';
import 'package:persistence_component_impl/sharedpref_impl.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:get_it/get_it.dart';
import 'package:home_manager_impl/home_manager_impl.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:network_component_impl/network_component_impl.dart';

import 'feature_provider_impl.dart';

class ProductLauncherImpl implements ProductLauncher {
  static HomeManager homeManager;
  static LoginManager loginManager;
  static GetIt productGetItInstance = GetIt.instance;

  ProductLauncherImpl() {
    registerProductDependencies();
  }

  addFeatures() async {
    productGetItInstance.registerSingleton(GetIt.asNewInstance(), instanceName: 'LoginGetIt');
    productGetItInstance.registerSingleton(GetIt.asNewInstance(), instanceName: 'HomeGetIt');
    getFeatureProvider().addFeature(_getLoginManager());
    getFeatureProvider().addFeature(_getHomeManager());
  }

  LoginManager _getLoginManager() {
    if (loginManager == null) {
      loginManager = LoginManagerImpl();
    }
    return loginManager
      ..registerDependencies(
        sharedPrefComponent: productGetItInstance.get<SharedPrefComponent>(),
        networkComponent: productGetItInstance.get<NetworkComponent>(),
        navigationService: getNavigationService(),
        featureProvider: productGetItInstance.get<FeatureProvider>(),
      );
  }

  HomeManager _getHomeManager() {
    if (homeManager == null) {
      homeManager = HomeManagerImpl();
    }
    return homeManager
      ..registerDependencies(
        localPersistenceComponent:
            productGetItInstance.get<LocalPersistenceComponent>(),
        navigationService: getNavigationService(),
        featureProvider: productGetItInstance.get<FeatureProvider>(),
      );
  }

  void registerProductDependencies() {
    productGetItInstance
        .registerLazySingleton<NavigationService>(() => NavigationService());
    productGetItInstance.registerLazySingleton<FeatureProvider>(
        () => FeatureProviderImpl(featureList: []));
    productGetItInstance
        .registerLazySingleton<NetworkComponent>(() => NetworkComponentImpl());
    productGetItInstance.registerLazySingleton<SharedPrefComponent>(
        () => SharedPreferenceComponentImpl());
    productGetItInstance.registerLazySingleton<LocalPersistenceComponent>(
        () => LocalPersistenceComponentImpl());
  }

  @override
  NavigationService getNavigationService() =>
      productGetItInstance.get<NavigationService>();

  @override
  String name = 'GoPay';

  @override
  FeatureProvider getFeatureProvider() {
    return productGetItInstance.get<FeatureProvider>();
  }
}
