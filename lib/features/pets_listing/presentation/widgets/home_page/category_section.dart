import 'package:flutter/material.dart';

import 'pet_category_tile.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PetCategoryTile(
                  icon: "assets/icons/dog.png",
                  categoryName: "Dogs",
                ),
                PetCategoryTile(
                  icon: "assets/icons/cat.png",
                  categoryName: "Cats",
                ),
                PetCategoryTile(
                  icon: "assets/icons/bird.png",
                  categoryName: "Birds",
                ),
                PetCategoryTile(
                  icon: "assets/icons/fish.png",
                  categoryName: "Fishes",
                ),
                PetCategoryTile(
                  icon: "assets/icons/pet.png",
                  categoryName: "All",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
