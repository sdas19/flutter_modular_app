import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:persistence_component/persistence_component.dart';

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
              "Database hashcode -> ${GetIt.instance.get<LocalPersistenceComponent>().db.hashCode.toString()}"),
        ),
      ),
    );
  }
}
