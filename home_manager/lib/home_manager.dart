import 'package:flutter/material.dart';

abstract class HomeManager {
  Widget getHomeFeatureGateway();
  void destroyHomeScope();
}