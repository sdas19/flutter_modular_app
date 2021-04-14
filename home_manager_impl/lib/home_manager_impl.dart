import 'package:flutter/material.dart';
import 'package:home_manager/home_manager.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:home_manager_impl/screen/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:persistence_component/persistence_component.dart';

class HomeManagerImpl implements HomeManager {
  final LocalPersistenceComponent localPersistenceComponent;

  HomeManagerImpl({this.localPersistenceComponent}) {
    HomeManagerImplDepsResolver.instance.pushNewScope();
    HomeManagerImplDepsResolver.instance
        .registerLocalPersistenceComponent(localPersistenceComponent);
  }

  @override
  void destroyHomeScope() {
    print('scope destroyed till ${HomeManagerImplDepsResolver.scopeName}');
    GetIt.instance.popScopesTill(HomeManagerImplDepsResolver.scopeName);
  }

  @override
  Widget getHomeFeatureGateway() {
    return HomePage(
      onPop: destroyHomeScope,
    );
  }
}
