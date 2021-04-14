import 'package:app_structure/deeplink_model.dart';
import 'package:flutter/cupertino.dart';

abstract class Feature {
  String name;
  Widget initialScreen;
  List<DeeplinkModel> deeplinks;
}
