import 'package:flutter/material.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';

import '../widgets/pet_details_page/image_carousel_widget.dart';
import '../widgets/pet_details_page/pet_action_bar.dart';
import '../widgets/pet_details_page/pet_age_weight_widget.dart';
import '../widgets/pet_details_page/pet_description.dart';
import '../widgets/pet_details_page/pet_owner_tile.dart';
import '../widgets/pet_details_page/pet_title_widget.dart';

class PetDetailsPage extends StatelessWidget {
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: const Text("Pet Details"),
                  actions: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      label: Text(petEntity.owner.city),
                    )
                  ],
                ),
                ImageCaroselWidget(picsList: petEntity.pics),
                PetTitleWidget(
                  name: petEntity.name,
                  breed: petEntity.breed,
                  male: petEntity.gender,
                ),
                PetOwner(
                  ownerName: petEntity.owner.name,
                  posted: petEntity.createdAt,
                ),
                PetAgeWeightWidget(
                  age: petEntity.age,
                  weight: petEntity.weight,
                  inkg: petEntity.inkg,
                ),
                PetDescription(desc: petEntity.desc),
              ],
            ),
          ),
        ),
        bottomNavigationBar: PetActionBar(petEntity: petEntity),
      ),
    );
  }

  const PetDetailsPage({
    super.key,
    required this.petEntity,
  });
}
