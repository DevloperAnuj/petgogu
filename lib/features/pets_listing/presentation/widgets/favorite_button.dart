import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';
import 'package:petgogu/utils/my_utils.dart';

import '../../../../utils/service_config.dart';
import '../manager/fetch_favorites_pets/fetch_favorite_pets_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final PetEntity pet;

  const FavoriteButton({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<FetchFavoritePetsCubit>()..fetchFavPets(),
      child: Builder(builder: (context) {
        return IconButton(
          onPressed: () async {
            if (await toAuthWrap(context)) {
              context.read<FetchFavoritePetsCubit>().addToFavoriteList(pet);
            }
          },
          icon: Icon(
            context
                    .watch<FetchFavoritePetsCubit>()
                    .state
                    .petsList
                    .any((element) => element.id == pet.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
        );
      }),
    );
  }
}
