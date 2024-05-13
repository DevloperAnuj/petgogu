import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_my_pets/fetch_my_pets_cubit.dart';

import '../../../domain/entities/pet_entitiety.dart';
import 'my_pets_list_card.dart';

class MyPetsList extends StatelessWidget {
  const MyPetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMyPetsCubit, FetchMyPetsState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: Lottie.asset(
              'assets/anims/bird.json',
              width: 150,
              height: 150,
            ),
          );
        }
        if (state.err != "") {
          return const Center(child: Icon(Icons.error_rounded));
        }
        if (state.petsList.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.petsList.length,
              itemBuilder: (c, i) {
                final pet = state.petsList[i];
                return MyPetListCard(i: i, petEntity: pet);
              },
              separatorBuilder: (c, i) {
                return const SizedBox();
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
