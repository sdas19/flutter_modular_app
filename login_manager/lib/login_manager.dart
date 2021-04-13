import 'package:flutter/material.dart';

abstract class LoginManager {
  Widget getLoginPage();
  void destroyLoginScope();
}