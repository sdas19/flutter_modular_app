import 'package:flutter/material.dart';
import 'package:home_manager_impl/screen/home_second_page.dart';
import 'package:navigation/navigation.dart';

class HomePage extends StatefulWidget {
  final Function onPop;

  HomePage({this.onPop});

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
    String args = ModalRoute.of(context).settings.arguments as String;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome ${args ?? ""}"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushRoute(context: context, destRoute: HomeSecondPage());
          },
          tooltip: 'Increment',
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
