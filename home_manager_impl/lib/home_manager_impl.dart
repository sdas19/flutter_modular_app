import 'package:flutter/material.dart';
import 'package:home_manager/home_manager.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:home_manager_impl/screen/home_page.dart';
import 'package:navigation/route_names.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';
import 'package:app_structure/deeplink_model.dart';
import 'package:app_structure/product_structure.dart';

class HomeManagerImpl implements HomeManager {
  @override
  void registerDependencies(
      {LocalPersistenceComponent localPersistenceComponent,
      NavigationService navigationService,
      FeatureProvider featureProvider}) {
    HomeManagerImplDepsResolver.instance
        .registerFeatureProvider(featureProvider);
    HomeManagerImplDepsResolver.instance
        .registerNavigationService(navigationService);
    HomeManagerImplDepsResolver.instance
        .registerLocalPersistenceComponent(localPersistenceComponent);
  }

  @override
  List<DeeplinkModel> deeplinks = [
    DeeplinkModel(deeplink: 'gopay://home', screen: HomePage())
  ];

  @override
  Widget initialScreen = HomePage(
    onPop: HomeManagerImplDepsResolver.instance.clearDependencyGraph(),
  );

  @override
  String name = HOME;
}
