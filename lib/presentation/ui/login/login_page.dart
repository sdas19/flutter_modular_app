import 'package:flutter/material.dart';
import 'package:flutter_modular_app/presentation/navigation/navigation.dart';
import 'package:product_launcher/product_launcher.dart';
import 'package:product_launcher/product_launcher_impl.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final ProductLauncher productLauncher = ProductLauncherImpl();

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
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "GO TO HOME",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => navigateToHome(context, _login()),
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

  String _login() {
    return productLauncher
        .getLoginManager()
        .login(_emailTextController.text, _passwordTextController.text);
  }
}
