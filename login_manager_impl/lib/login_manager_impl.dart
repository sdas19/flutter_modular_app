import 'package:flutter/material.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';
import 'package:login_manager_impl/screen/login_page.dart';
import 'package:navigation/route_names.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';
import 'package:app_structure/deeplink_model.dart';
import 'package:app_structure/product_structure.dart';

class LoginManagerImpl implements LoginManager {
  @override
  void registerDependencies(
      {SharedPrefComponent sharedPrefComponent,
      NetworkComponent networkComponent,
      NavigationService navigationService,
      FeatureProvider featureProvider}) {
    LoginManagerImplDepsResolver.instance
        .registerFeatureProvider(featureProvider);
    LoginManagerImplDepsResolver.instance
        .registerNavigationService(navigationService);
    LoginManagerImplDepsResolver.instance
        .registerSharedPrefComponent(sharedPrefComponent);
    LoginManagerImplDepsResolver.instance
        .registerNetworkComponent(networkComponent);
    LoginManagerImplDepsResolver.instance.registerFeatureDependencies();
  }

  @override
  List<DeeplinkModel> deeplinks = [
    DeeplinkModel(deeplink: 'gopay://login', screen: LoginPage())
  ];

  @override
  Widget initialScreen = LoginPage(onPop: () {
    LoginManagerImplDepsResolver.instance.clearDependencyGraph();
  });

  @override
  String name = LOGIN;
}
