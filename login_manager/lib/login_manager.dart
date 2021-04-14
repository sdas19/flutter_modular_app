import 'package:flutter/material.dart';
import 'package:navigation/navigation_service.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';

abstract class LoginManager {
  Widget getLoginFeatureGateway();

  void registerDependencies(
      {SharedPrefComponent sharedPrefComponent,
      NetworkComponent networkComponent,
      NavigationService navigationService});

  void destroyLoginScope();
}
