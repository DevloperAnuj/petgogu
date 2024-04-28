import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';
import 'dart:math' as math;

import 'package:petgogu/utils/my_utils.dart';

class PetCategoryTile extends StatelessWidget {
  final String categoryName;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FetchPetsCubit>().showPetsByCategory(categoryName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
              color: MyUtils().randomColour,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(icon),
                ),
              ),
              Text(
                categoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  const PetCategoryTile({
    super.key,
    required this.categoryName,
    required this.icon,
  });
}
