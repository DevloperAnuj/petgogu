import 'package:flutter/material.dart';

class PetDescription extends StatelessWidget {
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        desc,
      ),
    );
  }

  const PetDescription({
    super.key,
    required this.desc,
  });
}
