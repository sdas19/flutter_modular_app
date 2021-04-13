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
        // When navigating to the "/" route, build the FirstScreen widget.
        INITIAL_ROUTE: (context) => productLauncher.getLoginManager().getLoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        HOME_ROUTE: (context) => productLauncher.getHomeManager().getHomePage(),
      },
    );
  }
}


