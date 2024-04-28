import 'package:flutter/material.dart';

class CityPickerWidget extends StatelessWidget {
  const CityPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_rounded, color: Colors.red),
            const SizedBox(width: 10),
            DropdownButton<String>(
              value: "Pune",
              icon: const Icon(null),
              elevation: 16,
              onChanged: (selected) {},
              underline: const SizedBox(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              items: <String>['Pune', 'Mumbai', 'Karad', 'Jaipur', 'Chennai']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, textAlign: TextAlign.center),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
