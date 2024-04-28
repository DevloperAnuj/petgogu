import 'package:flutter/material.dart';
import 'package:petgogu/features/auth/presentation/pages/auth_page.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/home_page.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: serviceConfig.get<SupabaseClient>().auth.onAuthStateChange,
      builder: (context, snap) {
        if (snap.hasData && snap.data!.session != null) {
          return const MyHomePage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
