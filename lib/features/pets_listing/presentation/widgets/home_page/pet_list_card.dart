import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/pet_details_page.dart';
import '../../../domain/entities/pet_entitiety.dart';
import '../favorite_button.dart';

class PetListCard extends StatelessWidget {
  final int i;
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetDetailsPage(
                petEntity: petEntity,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Image.network(
                petEntity.pics.first,
                fit: BoxFit.cover,
                height: 200,
                width: 200,
                cacheWidth:
                    (200 * MediaQuery.of(context).devicePixelRatio.toInt()),
              ),
              Column(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  ListTile(
                    dense: true,
                    title: Text(
                      petEntity.name,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1, 1.0),
                            blurRadius: 8.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      petEntity.breed,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1, 1.0),
                            blurRadius: 8.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          ),
                        ],
                      ),
                    ),
                    trailing: FavoriteButton(pet: petEntity),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  const PetListCard({
    super.key,
    required this.i,
    required this.petEntity,
  });
}
