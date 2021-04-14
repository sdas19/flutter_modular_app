import 'package:flutter/material.dart';
import 'package:home_manager/home_manager.dart';
import 'package:home_manager_impl/screen/home_page.dart';
import 'package:navigation/route_names.dart';
import 'package:app_structure/deeplink_model.dart';

class HomeManagerImpl implements HomeManager {

  @override
  List<DeeplinkModel> deeplinks = [
    DeeplinkModel(deeplink: 'gopay://home', screen: HomePage())
  ];

  @override
  Widget initialScreen({dynamic args}) => HomePage(args: args);

  @override
  String name = HOME;
}
