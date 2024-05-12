import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/service_config.dart';

part 'login_logic_state.dart';

class LoginLogicCubit extends Cubit<LoginLogicState> {
  LoginLogicCubit() : super(LoginLogicInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  void loginUser(String email, String pass) async {
    emit(LoginLogicLoading());
    try {
      await client.auth.signInWithPassword(
        password: pass,
        email: email,
      );
      emit(LoginLogicSuccess());
    } on AuthException catch (e) {
      print(e.message);
      emit(LoginLogicError(err: e.message));
    }
  }

  void sendOtpWithPhone(String phone) async {
    emit(LoginLogicLoading());
    try {
      await client.auth.signInWithOtp(phone: "+91${phone}");
      emit(LoginLogicOtpSend());
    } on AuthException catch (e) {
      print(e.message);
      emit(LoginLogicError(err: e.message));
    }
  }

  void verifyAndLogin(String otp, String phone) async {
    emit(LoginLogicLoading());
    try {
      await client.auth.verifyOTP(
        phone: "+91${phone}",
        token: otp,
        type: OtpType.sms,
      );
      emit(LoginLogicSuccess());
    } on AuthException catch (e) {
      print(e.message);
      emit(LoginLogicError(err: e.message));
    }
  }

  void logOut() async {
    emit(LoginLogicLoading());
    await client.auth.signOut();
  }
}
