import 'package:flutter/material.dart';

class PetAgeWeightWidget extends StatelessWidget {
  final double weight;
  final double age;
  final bool inkg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade300.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Age",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("${age.round()} Months Old"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green.shade300.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weight",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("${weight.round()} " "${inkg ? 'KG' : 'grams'}"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  const PetAgeWeightWidget({
    super.key,
    required this.weight,
    required this.age,
    required this.inkg,
  });
}
