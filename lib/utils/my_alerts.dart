import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void showMySnackBarNonDismiss(
    BuildContext context, {
    required String content,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
      action: SnackBarAction(
        label: "Proceed",
        onPressed: () {},
        textColor: Colors.white,
      ),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void openWeb(String link) async {
    final url = Uri.parse("$link");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
