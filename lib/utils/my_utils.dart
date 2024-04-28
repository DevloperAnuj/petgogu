import 'package:flutter/painting.dart';
import 'dart:math' as math;

class Constants {
  static const String supaUrl = "https://sliujkuhfhxdryhdknxn.supabase.co";
  static const String supaKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNsaXVqa3VoZmh4ZHJ5aGRrbnhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQxMzgwNzIsImV4cCI6MjAyOTcxNDA3Mn0.Vnw8xo3XrYtWKolmnXKBJJgbqMlX_60ovsuQs3m9pCM";
}

class MyUtils {
  Color randomColour =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
