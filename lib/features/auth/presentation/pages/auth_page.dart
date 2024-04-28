import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/auth_toggle/auth_toggle_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/login_logic/login_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/reg_logic/reg_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/widgets/auth_page/login_form.dart';
import 'package:petgogu/features/auth/presentation/widgets/auth_page/register_form.dart';
import 'package:petgogu/utils/service_config.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthToggleCubit(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<LoginLogicCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<RegLogicCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<UserLogicCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<AuthToggleCubit, bool>(
            builder: (context, isReg) {
              if (isReg) {
                return const RegistrationForm();
              }
              return const LoginForm();
            },
          ),
        );
      }),
    );
  }
}
