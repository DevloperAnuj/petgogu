import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_toggle_state.dart';

class AuthToggleCubit extends Cubit<bool> {
  AuthToggleCubit() : super(false);

  void toggleAuthForm(bool isReg){
    emit(isReg);
  }

}
