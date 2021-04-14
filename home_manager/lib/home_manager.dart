import 'package:flutter/material.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';

abstract class HomeManager {
  Widget getHomeFeatureGateway();

  void registerDependencies(
      {LocalPersistenceComponent localPersistenceComponent,
      NavigationService navigationService});

  void destroyHomeScope();
}
