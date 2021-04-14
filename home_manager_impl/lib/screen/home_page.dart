import 'package:flutter/material.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:home_manager_impl/screen/home_second_page.dart';
import 'package:navigation/navigation.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  final Function onPop;
  final String args;

  HomePage({this.onPop, this.args});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome ${widget.args ?? ""}"),
        ),
        body: Center(
          child: Text(
              "Database hashcode -> ${HomeManagerImplDepsResolver.homeGetIt.get<Future<Database>>().hashCode.toString()}"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushRoute(context: context, destRoute: HomeSecondPage());
          },
          tooltip: 'Navigation',
          child: Icon(Icons.navigation),
        ),
      ),
      onWillPop: () {
        widget.onPop.call();
        return Future<bool>.value(true);
      },
    );
  }
}
