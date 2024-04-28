import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlerts {
  static void showMySnackBar(
    BuildContext context, {
    required String content,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }
}
