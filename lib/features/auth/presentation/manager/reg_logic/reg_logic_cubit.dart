import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reg_logic_state.dart';

class RegLogicCubit extends Cubit<RegLogicState> {
  RegLogicCubit() : super(RegLogicInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  void registerUser(String email, String pass) async {
    emit(RegLogicLoading());
    try {
      final AuthResponse authResponse = await client.auth.signUp(
        password: pass,
        email: email,
      );
      emit(RegLogicSuccess(uid: authResponse.user!.id));
    } on AuthException catch (e) {
      print(e.message);
      emit(RegLogicError(err: e.message));
    }
  }

}
