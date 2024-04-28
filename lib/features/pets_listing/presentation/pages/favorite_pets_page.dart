import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_favorites_pets/fetch_favorite_pets_cubit.dart';
import 'package:petgogu/utils/service_config.dart';

import '../widgets/favorite_pets_page/favorite_pets_list.dart';

class FavoritePetsPage extends StatelessWidget {
  const FavoritePetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<FetchFavoritePetsCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Favorites Pets page"),
              ),
              const MyFavoritePetsList(),
            ],
          ),
        ),
      ),
    );
  }
}
