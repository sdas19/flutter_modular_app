import 'package:flutter/material.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';
import 'package:core/core_component.dart';
import 'package:login_manager_impl/screen/login_page.dart';
import 'package:get_it/get_it.dart';

class LoginManagerImpl implements LoginManager {
  final CoreComponent coreComponent;

  LoginManagerImpl({this.coreComponent}) {
    LoginManagerImplDepsResolver.instance.registerFeature(coreComponent);
  }

  @override
  void destroyLoginScope() {
    GetIt.instance.popScopesTill(LoginManagerImplDepsResolver.scopeName);
  }

  @override
  Widget getLoginPage() {
    return LoginPage(
      onPop: destroyLoginScope,
    );
  }
}
