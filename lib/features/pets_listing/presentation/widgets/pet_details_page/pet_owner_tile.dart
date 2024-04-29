import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetOwner extends StatelessWidget {
  final String ownerName;
  final DateTime posted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/icons/person.png'),
      ),
      title: Text(ownerName),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Pet Owner"),
          Text(DateFormat.yMMMd().format(posted).toString()),
        ],
      ),
    );
  }

  const PetOwner({
    super.key,
    required this.ownerName,
    required this.posted,
  });
}
