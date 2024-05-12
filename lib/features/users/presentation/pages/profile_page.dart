import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/login_logic/login_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/pages/my_pets_page.dart';
import 'package:petgogu/features/users/presentation/pages/edit_profile_page.dart';
import 'package:petgogu/utils/service_config.dart';

import '../widgets/profile_page/logout_button.dart';
import '../widgets/profile_page/profile_cover_widget.dart';
import '../widgets/profile_page/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<UserLogicCubit>()..fetchedCurrentUser(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<LoginLogicCubit>(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text("Profile"),
                ),
                const ProfileCoverWidget(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocBuilder<UserLogicCubit, UserLogicState>(
                      builder: (context, state) {
                        if (state is UserLogicSuccess) {
                          return Text(
                            state.userEntity.name,
                            style: const TextStyle(
                              color: Color(0xFF101213),
                              fontSize: 32,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                          );
                        }
                        if (state is UserLogicLoading) {
                          return const LinearProgressIndicator();
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocBuilder<UserLogicCubit, UserLogicState>(
                      builder: (context, state) {
                        if (state is UserLogicSuccess) {
                          return Text(
                            state.userEntity.email,
                            style: const TextStyle(
                              color: Color(0xFF101213),
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          );
                        }
                        if (state is UserLogicLoading) {
                          return const LinearProgressIndicator();
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Your Account',
                      style: TextStyle(
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                BlocBuilder<UserLogicCubit, UserLogicState>(
                  builder: (context, state) {
                    if (state is UserLogicSuccess) {
                      return ProfileTile(
                        tileName: "Edit Profile",
                        tileIcon: Icons.account_circle,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                userEntity: state.userEntity,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is UserLogicLoading) {
                      return const LinearProgressIndicator();
                    }
                    return const SizedBox();
                  },
                ),
                ProfileTile(
                  tileName: "My Pets",
                  tileIcon: Icons.pets,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyPetsPage(),
                      ),
                    );
                  },
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'App Info',
                      style: TextStyle(
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                ProfileTile(
                  tileName: "Supports",
                  tileIcon: Icons.support_agent,
                  onTap: () {},
                ),
                ProfileTile(
                  tileName: "Terms and Conditions",
                  tileIcon: Icons.privacy_tip,
                  onTap: () {},
                ),
                const LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
