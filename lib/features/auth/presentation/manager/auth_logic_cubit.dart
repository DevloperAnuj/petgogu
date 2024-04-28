import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_logic_state.dart';

class AuthLogicCubit extends Cubit<AuthLogicState> {
  AuthLogicCubit() : super(AuthLogicInitial());
}
