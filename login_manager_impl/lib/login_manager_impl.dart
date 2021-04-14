import 'package:flutter/material.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';
import 'package:login_manager_impl/screen/login_page.dart';
import 'package:get_it/get_it.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';

class LoginManagerImpl implements LoginManager {
  final SharedPrefComponent sharedPrefComponent;
  final NetworkComponent networkComponent;

  LoginManagerImpl({this.sharedPrefComponent, this.networkComponent}) {
    LoginManagerImplDepsResolver.instance.pushLoginScope();
    LoginManagerImplDepsResolver.instance.registerSharedPrefComponent(sharedPrefComponent);
    LoginManagerImplDepsResolver.instance.registerNetworkComponent(networkComponent);
    LoginManagerImplDepsResolver.instance.registerFeatureDependencies();
  }

  @override
  void destroyLoginScope() {
    print('scope destroyed till ${LoginManagerImplDepsResolver.scopeName}');
    GetIt.instance.popScopesTill(LoginManagerImplDepsResolver.scopeName);
  }

  @override
  Widget getLoginFeatureGateway() {
    return LoginPage(
      onPop: destroyLoginScope,
    );
  }
}
