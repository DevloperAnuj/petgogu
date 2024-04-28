import 'package:flutter/material.dart';
import 'package:petgogu/features/users/presentation/pages/profile_page.dart';

class BottomNavAvtar extends StatelessWidget {
  final Widget toScreen;
  final String iconPath;

  const BottomNavAvtar({
    super.key,
    required this.iconPath,
    required this.toScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => toScreen,
            ),
          );
        },
        child: Hero(
          tag: "profile",
          child: CircleAvatar(
            backgroundColor: Colors.pinkAccent.shade100,
            child: CircleAvatar(
              backgroundImage: AssetImage(iconPath),
            ),
          ),
        ),
      ),
    );
  }
}
