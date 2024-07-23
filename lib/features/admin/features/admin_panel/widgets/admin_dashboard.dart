import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/admin_panel_logic/admin_panel_logic_cubit.dart';
import '../manager/fetch_admin_pets/fetch_admin_pets_cubit.dart';
import '../manager/fetch_users/admin_fetch_users_cubit.dart';
import 'fetch_properties_temp.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelLogicCubit, int>(
      builder: (context, index) {
        return Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                const FetchPropertiesTemp(),
                const Text(
                  "PET GOGU Admin",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  tileColor: index == 0 ? Colors.yellow.shade100 : null,
                  leading: const Icon(Icons.query_builder),
                  title: const Text("Pending Pets"),
                  onTap: () {
                    context.read<AdminPanelLogicCubit>().togglePanel(0);
                  },
                  trailing: Text("(${getPetCount(3, context)})"),
                ),
                const SizedBox(height: 10),
                ListTile(
                  tileColor: index == 1 ? Colors.green.shade100 : null,
                  leading: const Icon(Icons.done_outline_outlined),
                  title: const Text("Approved Pets"),
                  onTap: () {
                    context.read<AdminPanelLogicCubit>().togglePanel(1);
                  },
                  trailing: Text("(${getPetCount(0, context)})"),
                ),
                const SizedBox(height: 10),
                ListTile(
                  tileColor: index == 2 ? Colors.red.shade100 : null,
                  leading: const Icon(Icons.delete),
                  title: const Text("De-listed Pets"),
                  onTap: () {
                    context.read<AdminPanelLogicCubit>().togglePanel(2);
                  },
                  trailing: Text("(${getPetCount(1, context)})"),
                ),
                const SizedBox(height: 10),
                ListTile(
                  tileColor: index == 3 ? Colors.orange.shade100 : null,
                  leading: const Icon(Icons.cancel),
                  title: const Text("Withheld Pets"),
                  onTap: () {
                    context.read<AdminPanelLogicCubit>().togglePanel(3);
                  },
                  trailing: Text("(${getPetCount(2, context)})"),
                ),
                const SizedBox(height: 10),
                ListTile(
                  tileColor: index == 4 ? Colors.blueGrey.shade100 : null,
                  leading: const Icon(Icons.person),
                  title: const Text("Users"),
                  onTap: () {
                    context.read<AdminPanelLogicCubit>().togglePanel(4);
                  },
                  trailing: Text(
                    "(${context.watch<AdminFetchUsersCubit>().state.allUsers.length})",
                  ),
                ),
                const SizedBox(height: 10),
                // ListTile(
                //   tileColor: index == 5 ? Colors.blueGrey.shade100 : null,
                //   leading: const Icon(Icons.flag),
                //   title: const Text("Reports"),
                //   onTap: () {
                //     context.read<AdminPanelLogicCubit>().togglePanel(5);
                //   },
                //   trailing: Text(
                //     "(${context.watch<AdminFetchReportsCubit>().state.reportsList.length})",
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

int getPetCount(int status, BuildContext context) {
  return context
      .watch<FetchAdminPetsCubit>()
      .state
      .allPets
      .where((p) => p.status == status)
      .toList()
      .length;
}