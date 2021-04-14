import 'package:firebase_login/firebase_login.dart';
import 'package:flutter/material.dart';
import 'package:app_structure/product_structure.dart';
import 'package:app_structure/feature_structure.dart';
import 'package:login_manager_impl/login_manager_impl_deps_resolver.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation/route_names.dart';

class LoginPage extends StatefulWidget {
  final Function onPop;

  LoginPage({this.onPop});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                "This is going to be the X login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailTextController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              ],
            ),
            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Column(
                    children: [
                      RaisedButton(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        child: Text(
                          "GO TO HOME",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _login(email: _emailTextController.text,
                              password: _passwordTextController.text);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ), onWillPop: (){
      widget.onPop.call();
      return Future<bool>.value(true);
    });
  }

  void _login({String email, String password}) {
    String result = LoginManagerImplDepsResolver.loginGetIt.get<FirebaseLoginManager>().login(
        email, password);
    Feature homeScreen = LoginManagerImplDepsResolver.loginGetIt.get<FeatureProvider>().provideFeature(HOME);
    pushRoute(context: context, destRoute: homeScreen.initialScreen);
  }
}
