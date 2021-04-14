import 'package:flutter/material.dart';
import 'package:login_manager/login_manager.dart';
import 'package:login_manager_impl/screen/login_page.dart';
import 'package:navigation/route_names.dart';
import 'package:app_structure/deeplink_model.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_login/firebase_login.dart';
import 'package:server_login/server_login.dart';

class LoginManagerImpl implements LoginManager {
  LoginManagerImpl() {
    _registerFeatureDependencies();
  }

  @override
  List<DeeplinkModel> deeplinks = [
    DeeplinkModel(deeplink: 'gopay://login', screen: LoginPage())
  ];

  @override
  Widget initialScreen({dynamic args}) => LoginPage(args: args);

  @override
  String name = LOGIN;

  _registerFeatureDependencies() {
    GetIt.instance.registerLazySingleton<FirebaseLoginManager>(
        () => FirebaseLoginManager.instance);
    GetIt.instance.registerLazySingleton<ServerLoginManager>(
        () => ServerLoginManager.instance);
  }
}
