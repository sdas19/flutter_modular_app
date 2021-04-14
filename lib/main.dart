import 'package:flutter/material.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:product_launcher/product_launcher_impl.dart';
import 'package:navigation/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final productLauncher = ProductLauncherImpl();
  await productLauncher.addFeatures();
  runApp(MyApp(productLauncher));
}

class MyApp extends StatelessWidget {
  final ProductLauncher productLauncher;

  MyApp(this.productLauncher);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: productLauncher
            .getFeatureProvider()
            .provideFeature(LOGIN)
            .initialScreen());
  }
}
