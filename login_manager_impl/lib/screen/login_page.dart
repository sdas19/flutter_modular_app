import 'package:firebase_login/firebase_login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/route_names.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
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
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login({String email, String password}) {
    String result = GetIt.instance.get<FirebaseLoginManager>().login(
        email, password);
    Navigator.pushNamed(context, HOME_ROUTE, arguments: result);
  }
}
