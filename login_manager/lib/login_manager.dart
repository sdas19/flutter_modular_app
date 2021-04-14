import 'package:flutter/material.dart';

abstract class LoginManager {
  Widget getLoginFeatureGateway();
  void destroyLoginScope();
}