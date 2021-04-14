import 'package:flutter/material.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:product_launcher/product_launcher_impl.dart';
import 'package:navigation/route_names.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ProductLauncher productLauncher = ProductLauncherImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: productLauncher.getNavigationService().getNavigatorKey(),
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case HOME_ROUTE:
              return MaterialPageRoute(
                  builder: (context) =>
                      productLauncher.getHomeManager().getHomeFeatureGateway());
            default:
              return MaterialPageRoute(
                  builder: (context) => productLauncher
                      .getLoginManager()
                      .getLoginFeatureGateway());
          }
        },
        home: productLauncher.getLoginManager().getLoginFeatureGateway());
  }
}
