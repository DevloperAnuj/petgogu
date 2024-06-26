import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_my_pets/fetch_my_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/pet_details_page.dart';
import 'dart:math' as math;
import '../../../domain/entities/pet_entitiety.dart';

class MyPetListCard extends StatelessWidget {
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
        child: Row(
          children: [
            (i + 1).isEven
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      petEntity.pics.first,
                      height: 180,
                      width: 120,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              petEntity.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              petEntity.breed,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${petEntity.age} Months Old",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(petEntity.gender ? Icons.male : Icons.female),
                          ],
                        ),
                      ),
                    ),
                  ),
            (i + 1).isOdd
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      petEntity.pics.first,
                      height: 180,
                      width: 120,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              petEntity.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              petEntity.breed,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${petEntity.age} Months old",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(petEntity.gender ? Icons.male : Icons.female),
                          ],
                        ),
                      ),
                    ),
                  ),
            IconButton(
              onPressed: () {
                context.read<FetchMyPetsCubit>().deListMyPet(petEntity);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  const MyPetListCard({
    super.key,
    required this.i,
    required this.petEntity,
  });
}
