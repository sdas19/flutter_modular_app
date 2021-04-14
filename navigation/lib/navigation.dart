import 'package:flutter/material.dart';

void pushRoute(
    {BuildContext context, Widget destRoute, bool inDialog = false}) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => destRoute, fullscreenDialog: inDialog));
}

void popCurrentRoute(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}
