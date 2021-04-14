import 'package:flutter/material.dart';
import 'package:home_manager_impl/home_manager_impl_deps_resolver.dart';
import 'package:sqflite/sqflite.dart';

class HomeSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoPay Home Second Screen'),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
              "Database hashcode -> ${HomeManagerImplDepsResolver.homeGetIt.get<Future<Database>>().hashCode.toString()}"),
        ),
      ),
    );
  }
}
