import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'temp_edit_profile_state.dart';

class TempEditProfileCubit extends Cubit<TempEditProfileState> {
  TempEditProfileCubit() : super(TempEditProfileState.initial());

  void getName(String name){
    emit(state.copyWith(name: name));
  }

  void getEmail(String email){
    emit(state.copyWith(email: email));
  }

  void getCity(String city){
    emit(state.copyWith(city: city));
  }

}
