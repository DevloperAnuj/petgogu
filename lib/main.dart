import 'package:flutter/material.dart';
import 'package:petgogu/features/auth/presentation/pages/splash_page.dart';
import 'package:petgogu/utils/my_utils.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Constants.supaUrl, anonKey: Constants.supaKey);
  initSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PET GOGU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
