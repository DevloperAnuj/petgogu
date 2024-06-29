import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petgogu/features/auth/presentation/pages/auth_wrapper.dart';
import 'dart:math' as math;

import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static const String supaUrl = "https://sliujkuhfhxdryhdknxn.supabase.co";
  static const String supaKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNsaXVqa3VoZmh4ZHJ5aGRrbnhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQxMzgwNzIsImV4cCI6MjAyOTcxNDA3Mn0.Vnw8xo3XrYtWKolmnXKBJJgbqMlX_60ovsuQs3m9pCM";
}

class MyUtils {
  Color randomColour =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

Future<bool> toAuthWrap(BuildContext context) async {
  final supabase = serviceConfig.get<SupabaseClient>();
  if (supabase.auth.currentUser == null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AuthWrapper(),
      ),
    );
    return false;
  } else {
    return true;
  }
}
