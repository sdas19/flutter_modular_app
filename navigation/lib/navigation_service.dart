import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class NavigationService {
  Future<dynamic> navigateTo(String routeName, {dynamic args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  GlobalKey<NavigatorState> getNavigatorKey() => navigatorKey;
}
