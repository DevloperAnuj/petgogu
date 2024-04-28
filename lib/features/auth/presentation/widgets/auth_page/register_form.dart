import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/reg_logic/reg_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/utils/my_alerts.dart';

import '../../manager/auth_toggle/auth_toggle_cubit.dart';
import 'auth_form_text_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent.shade700, const Color(0xFFEE8B60)],
            stops: const [0, 1],
            begin: const AlignmentDirectional(0.87, -1),
            end: const AlignmentDirectional(-0.87, 1),
          ),
        ),
        alignment: const AlignmentDirectional(0, -1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                child: Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: const Text(
                    'PET Gogu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 570,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(
                          0,
                          2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Join Family',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF101213),
                            fontSize: 36,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                          child: Text(
                            'Fill out the information below in order to Register your account.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        AuthFormTextField(
                          editingController: nameController,
                          label: "Name",
                        ),
                        AuthFormTextField(
                          label: "Email",
                          editingController: emailController,
                        ),
                        AuthFormTextField(
                          editingController: phoneController,
                          label: "Phone",
                        ),
                        AuthFormTextField(
                          editingController: cityController,
                          label: "City",
                        ),
                        AuthFormTextField(
                          editingController: passController,
                          label: "Password",
                          isSecure: true,
                        ),
                        BlocConsumer<RegLogicCubit, RegLogicState>(
                          listener: (context, state) {
                            if (state is RegLogicSuccess) {
                              context.read<UserLogicCubit>().regNewUser(
                                    email: emailController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    city: cityController.text,
                                  );
                            }
                            if (state is RegLogicError) {
                              MyAlerts.showMySnackBar(
                                context,
                                content: state.err,
                                color: Colors.red,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is RegLogicLoading) {
                              return const LinearProgressIndicator();
                            }
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<RegLogicCubit>().registerUser(
                                        emailController.text,
                                        passController.text,
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text("Register Account"),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<AuthToggleCubit>()
                                .toggleAuthForm(false);
                          },
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account?  ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'Sign In here',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                              style: TextStyle(
                                color: Color(0xFF101213),
                                fontSize: 14,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
