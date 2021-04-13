import 'package:flutter/material.dart';

abstract class HomeManager {
  Widget getHomePage();
  void destroyHomeScope();
}