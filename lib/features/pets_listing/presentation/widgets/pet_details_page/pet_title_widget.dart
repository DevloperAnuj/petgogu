import 'package:flutter/material.dart';

class PetTitleWidget extends StatelessWidget {
  final String name;
  final String breed;
  final bool male;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Text(breed),
      trailing: Icon(
        male ? Icons.male : Icons.female,
        color: Colors.red,
      ),
    );
  }

  const PetTitleWidget({
    super.key,
    required this.name,
    required this.breed,
    required this.male,

  });
}
