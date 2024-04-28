import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_favorites_pets/fetch_favorite_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/widgets/favorite_pets_page/favorite_pets_list_card.dart';

import '../../../domain/entities/pet_entitiety.dart';

class MyFavoritePetsList extends StatelessWidget {
  const MyFavoritePetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFavoritePetsCubit, FetchFavoritesPetsState>(
      builder: (context, state) {
        if (state.loading) {
          return const LinearProgressIndicator();
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
                return FavoritePetListCard(i: i, petEntity: pet);
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
