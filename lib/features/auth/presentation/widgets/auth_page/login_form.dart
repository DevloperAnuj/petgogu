import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/auth_toggle/auth_toggle_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/login_logic/login_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/my_alerts.dart';
import 'auth_form_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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
                          'Welcome',
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
                            'Provide the information below in order to access your account.',
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
                          label: "Phone",
                          editingController: phoneController,
                        ),
                        BlocBuilder<LoginLogicCubit, LoginLogicState>(
                          builder: (context, state) {
                            if (state is LoginLogicOtpSend) {
                              return AuthFormTextField(
                                editingController: otpController,
                                label: "OTP - 6 Digits",
                              );
                            }
                            return SizedBox();
                          },
                        ),
                        BlocConsumer<LoginLogicCubit, LoginLogicState>(
                          listener: (context, state) {
                            if (state is LoginLogicSuccess) {
                              print("Logged in Successfully");
                            }
                            if (state is LoginLogicError) {
                              MyAlerts.showMySnackBar(
                                context,
                                content: state.err,
                                color: Colors.red,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLogicLoading) {
                              return const LinearProgressIndicator();
                            }
                            if (state is LoginLogicOtpSend) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      context
                                          .read<LoginLogicCubit>()
                                          .verifyAndLogin(
                                            otpController.text.trim(),
                                            phoneController.text.trim(),
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("Verify And Login"),
                                  ),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    context
                                        .read<LoginLogicCubit>()
                                        .sendOtpWithPhone(
                                            phoneController.text.trim());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text("Send OTP"),
                                ),
                              ),
                            );
                          },
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     context
                        //         .read<AuthToggleCubit>()
                        //         .toggleAuthForm(true);
                        //   },
                        //   child: RichText(
                        //     textScaler: MediaQuery.of(context).textScaler,
                        //     text: const TextSpan(
                        //       children: [
                        //         TextSpan(
                        //           text: 'Don\'t have an account?  ',
                        //           style: TextStyle(),
                        //         ),
                        //         TextSpan(
                        //           text: 'Sign Up here',
                        //           style: TextStyle(
                        //             color: Colors.blueAccent,
                        //             fontSize: 14,
                        //             letterSpacing: 0,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //         )
                        //       ],
                        //       style: TextStyle(
                        //         color: Color(0xFF101213),
                        //         fontSize: 14,
                        //         letterSpacing: 0,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
