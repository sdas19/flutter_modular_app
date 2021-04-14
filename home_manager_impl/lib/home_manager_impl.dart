import 'package:flutter/material.dart';
import 'package:home_manager/home_manager.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:home_manager_impl/screen/home_page.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';

class HomeManagerImpl implements HomeManager {

  @override
  Widget getHomeFeatureGateway() {
    return HomePage(
      onPop: destroyHomeScope,
    );
  }

  @override
  void registerDependencies(
      {LocalPersistenceComponent localPersistenceComponent,
      NavigationService navigationService}) {
    HomeManagerImplDepsResolver.instance
        .registerNavigationService(navigationService);
    HomeManagerImplDepsResolver.instance
        .registerLocalPersistenceComponent(localPersistenceComponent);
  }

  @override
  void destroyHomeScope() {
    HomeManagerImplDepsResolver.instance.clearDependencyGraph();
  }
}
