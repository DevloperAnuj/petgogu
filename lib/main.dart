import 'package:flutter/material.dart';
import 'package:petgogu/features/admin/features/admin_panel/pages/admin_panel_page.dart';
import 'package:petgogu/features/auth/presentation/pages/splash_page.dart';
import 'package:petgogu/utils/my_utils.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // NetworkImageCache();
  await Supabase.initialize(url: Constants.supaUrl, anonKey: Constants.supaKey);
  WidgetsFlutterBinding.ensureInitialized();
  initSetup();
  runApp(const MyApp());
}

const bool isAdmin = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: isAdmin ? 'PET GOGU ADMIN' : 'PET GOGU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isAdmin ? AdminPanelPage() : const SplashPage(),
    );
  }
}

// class NetworkImageCache extends WidgetsFlutterBinding {
//   @override
//   ImageCache createImageCache() {
//     ImageCache imageCache = super.createImageCache();
//     /// Set your image cache size to 500 Mb
//     imageCache.maximumSizeBytes = 1024 * 1024 * 500;
//     return imageCache;
//   }
// }
//Analogy
//*
//delist 1
//approve 0
//withheld 2
//pending 3
//*