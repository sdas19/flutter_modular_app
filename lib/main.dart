import 'package:flutter/material.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:product_launcher/product_launcher_impl.dart';

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
      home: productLauncher.getLoginManager().getLoginPage(),
    );
  }
}


