import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petgogu/features/auth/presentation/pages/auth_wrapper.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthWrapper(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Pet Gogu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.blueAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(
                "assets/icons/lg1.png",
                height: 300,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
