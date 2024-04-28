import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_my_pets/fetch_my_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/add_pet_page.dart';
import 'package:petgogu/utils/service_config.dart';

import '../widgets/my_pets_page/my_pets_list.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<FetchMyPetsCubit>()..fetchMyPets(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("My Pets"),
              ),
              const MyPetsList(),
            ],
          ),
        ),
      ),
    );
  }
}
