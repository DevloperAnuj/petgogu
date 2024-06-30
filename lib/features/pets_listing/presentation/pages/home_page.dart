import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_favorites_pets/fetch_favorite_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/add_pet_page.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/favorite_pets_page.dart';
import 'package:petgogu/features/users/presentation/pages/profile_page.dart';
import 'package:petgogu/utils/my_alerts.dart';
import 'package:petgogu/utils/my_utils.dart';
import 'package:petgogu/utils/service_config.dart';

import '../../../users/presentation/pages/edit_profile_page.dart';
import '../../../users/presentation/widgets/profile_page/profile_tile.dart';
import '../widgets/home_page/adaption_only_toggle_switch.dart';
import '../widgets/home_page/category_section.dart';
import '../widgets/home_page/city_picker_widget.dart';
import '../widgets/home_page/pets_list_section.dart';
import '../widgets/home_page/search_section.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<UserLogicCubit>()..fetchedCurrentUser(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FetchPetsCubit>()..fetchInitialPets(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(builder: (context) {
            return RefreshIndicator(
              onRefresh: () async {
                return Future.delayed(Duration(seconds: 1), () {
                  context.read<FetchPetsCubit>().fetchInitialPets();
                });
              },
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchSection(),
                    AdaptionOnlyToggleSwitch(),
                    CategorySection(),
                    PetsListSection(),
                    CompleteProfile(),
                  ],
                ),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              if (await toAuthWrap(context)) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddPetsPage(),
                  ),
                );
              }
            },
            label: const Text("Add Pet"),
            icon: const Icon(Icons.add),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () async {
                    if (await toAuthWrap(context)) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FavoritePetsPage(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    MyAlerts.openWeb("https://petgogu.imalpha.in/");
                  },
                  icon: const Icon(Icons.store_rounded),
                ),
                IconButton(
                  onPressed: () async {
                    if (await toAuthWrap(context)) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLogicCubit, UserLogicState>(
      listener: (context, state) {
        if (state is UserLogicSuccess) {
          if (state.userEntity.name.isEmpty ||
              state.userEntity.email.isEmpty ||
              state.userEntity.city.isEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditProfilePage(
                  userEntity: state.userEntity,
                ),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return SizedBox(height: 50);
      },
    );
  }
}
