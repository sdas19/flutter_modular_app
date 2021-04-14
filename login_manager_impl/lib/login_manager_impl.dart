import 'package:flutter/material.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';
import 'package:login_manager_impl/screen/login_page.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';

class LoginManagerImpl implements LoginManager {

  @override
  void destroyLoginScope() {
    LoginManagerImplDepsResolver.instance.clearDependencyGraph();
  }

  @override
  Widget getLoginFeatureGateway() {
    return LoginPage(
      onPop: destroyLoginScope,
    );
  }

  @override
  void registerDependencies(
      {SharedPrefComponent sharedPrefComponent,
      NetworkComponent networkComponent,
      NavigationService navigationService}) {
    LoginManagerImplDepsResolver.instance
        .registerNavigationService(navigationService);
    LoginManagerImplDepsResolver.instance
        .registerSharedPrefComponent(sharedPrefComponent);
    LoginManagerImplDepsResolver.instance
        .registerNetworkComponent(networkComponent);
    LoginManagerImplDepsResolver.instance.registerFeatureDependencies();
  }
}
