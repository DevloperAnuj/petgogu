import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/utils/my_alerts.dart';

class EditChangesButton extends StatelessWidget {
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocConsumer<UserLogicCubit, UserLogicState>(
        listener: (context, state) {
          if (state is UserLogicSuccess) {
            MyAlerts.showMySnackBar(
              context,
              content: "User Updated Successfully !",
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          if (state is UserLogicLoading) {
            return LinearProgressIndicator();
          }
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text("Submit Changes"),
            ),
          );
        },
      ),
    );
  }

  const EditChangesButton({required this.onTap});
}
