import 'package:flutter/material.dart';
import 'package:home_manager_impl/screen/home_second_page.dart';
import 'package:navigation/navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:persistence_component/persistence_component.dart';

class HomePage extends StatefulWidget {
  final Function onPop;
  final String args;

  HomePage({this.onPop, this.args});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var appBarText = '';

  @override
  void initState() {
    super.initState();
    if(widget.args != null && widget.args is String) {
      appBarText = widget.args;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $appBarText"),
      ),
      body: Center(
        child: Text(
            "Database hashcode -> ${GetIt.instance.get<LocalPersistenceComponent>().db.hashCode}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushRoute(context: context, destRoute: HomeSecondPage());
        },
        tooltip: 'Navigation',
        child: Icon(Icons.navigation),
      ),
    );
  }
}
