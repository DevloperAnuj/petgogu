import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/admin/features/admin_panel/manager/fetch_admin_pets/fetch_admin_pets_cubit.dart';
import 'package:petgogu/features/admin/features/admin_panel/manager/fetch_users/admin_fetch_users_cubit.dart';

import '../../../../../utils/service_config.dart';
import '../manager/admin_panel_logic/admin_panel_logic_cubit.dart';
import '../widgets/admin_content.dart';
import '../widgets/admin_dashboard.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({super.key});

  static const String routeName = "/adminPanelPage";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceConfig.get<AdminPanelLogicCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              serviceConfig.get<FetchAdminPetsCubit>()..fetchProperties(),
        ),
        BlocProvider(
          create: (context) =>
              serviceConfig.get<AdminFetchUsersCubit>()..fetchAllUsers(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //   serviceConfig.get<AdminFetchReportsCubit>()..fetchReports(),
        // ),
      ],
      child: Builder(
        builder: (context) {
          return const Scaffold(
            body: Row(
              children: [
                AdminDashboard(),
                AdminContent(),
              ],
            ),
          );
        }
      ),
    );
  }
}