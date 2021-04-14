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
      initialRoute: INITIAL_ROUTE,
      routes: {
        // When navigating to the "/" route, build the LoginPage widget along with its dependencies lazily.
        INITIAL_ROUTE: (context) =>
            productLauncher.getLoginManager().getLoginFeatureGateway(),
        // When navigating to the "/home" route, build the HomePage widget along with its dependencies lazily.
        HOME_ROUTE: (context) => productLauncher.getHomeManager().getHomeFeatureGateway(),
      },
    );
  }
}
