import 'package:flutter/material.dart';
import 'package:petgogu/utils/my_alerts.dart';

class EditChangesButton extends StatelessWidget {
  const EditChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            MyAlerts.showMySnackBar(
              context,
              content: "Please Add Payment ID",
              color: Colors.amber,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          child: const Text("Submit Changes"),
        ),
      ),
    );
  }
}
