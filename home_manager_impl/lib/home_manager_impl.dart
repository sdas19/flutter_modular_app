import 'package:flutter/material.dart';
import 'package:home_manager/home_manager.dart';
import 'package:core/core_component.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:home_manager_impl/home_page.dart';
import 'package:get_it/get_it.dart';

class HomeManagerImpl implements HomeManager {
  final CoreComponent coreComponent;

  HomeManagerImpl({this.coreComponent}) {
    HomeManagerImplDepsResolver.instance.registerFeature(coreComponent);
  }

  @override
  void destroyHomeScope() {
    print('destroyHomeScope');
    GetIt.instance.popScopesTill(HomeManagerImplDepsResolver.scopeName);
  }

  @override
  Widget getHomePage() {
    return HomePage(
      onPop: destroyHomeScope,
    );
  }
}
