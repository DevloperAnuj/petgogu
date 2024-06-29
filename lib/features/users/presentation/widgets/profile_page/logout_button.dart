import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/login_logic/login_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/utils/my_alerts.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocBuilder<LoginLogicCubit, LoginLogicState>(
        builder: (context, state) {
          if (state is LoginLogicLoading) {
            return const CircularProgressIndicator();
          }
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await serviceConfig
                    .get<SupabaseClient>()
                    .auth
                    .signOut()
                    .then((value) {
                  context.read<UserLogicCubit>().setUserNull();
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text("Log Out"),
            ),
          );
        },
      ),
    );
  }
}

class DeleteAccButton extends StatelessWidget {
  const DeleteAccButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocBuilder<LoginLogicCubit, LoginLogicState>(
        builder: (context, state) {
          if (state is LoginLogicLoading) {
            return const CircularProgressIndicator();
          }
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                MyAlerts.showMySnackBar(
                  context,
                  content: "Your Account will be Deleted Shortly",
                  color: Colors.red,
                );
                await serviceConfig
                    .get<SupabaseClient>()
                    .auth
                    .signOut()
                    .then((value) {
                  context.read<UserLogicCubit>().setUserNull();
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, foregroundColor: Colors.white),
              child: const Text("Delete Account"),
            ),
          );
        },
      ),
    );
  }
}
