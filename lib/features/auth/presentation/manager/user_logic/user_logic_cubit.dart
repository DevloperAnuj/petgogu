import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/users/domain/entities/user_entity.dart';
import 'package:petgogu/utils/my_utils.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_logic_state.dart';

class UserLogicCubit extends Cubit<UserLogicState> {
  UserLogicCubit() : super(UserLogicInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  UserEntity? tempUser;

  void regNewUser({
    required String email,
    required String name,
    required String phone,
    required String city,
  }) async {
    emit(UserLogicLoading());
    try {
      final result = await client
          .from("users")
          .insert({
            'name': name,
            'email': email,
            'phone': phone,
            'city': city,
          })
          .select()
          .single();
      final encodedBody = jsonEncode(result);
      print(encodedBody);
      tempUser = UserEntity.fromJson(encodedBody);
      emit(UserLogicSuccess(userEntity: UserEntity.fromJson(encodedBody)));
    } on PostgrestException catch (e) {
      emit(UserLogicError(err: e.message));
    }
  }

  void updateUser({
    required String name,
    required String email,
    required String city,
  }) async {
    emit(UserLogicLoading());
    final uid = client.auth.currentUser!.id;
    try {
      final result = await client
          .from("users")
          .update({
            'name': name,
            'email': email,
            'city': city,
          })
          .eq('id', uid)
          .select()
          .single();
      final encodedBody = jsonEncode(result);
      tempUser = UserEntity.fromJson(encodedBody);
      emit(UserLogicSuccess(userEntity: UserEntity.fromJson(encodedBody)));
    } on PostgrestException catch (e) {
      emit(UserLogicError(err: e.message));
    }
  }

  void fetchedCurrentUser() async {
    if (client.auth.currentUser == null) {
      return;
    } else {
      if (tempUser == null) {
        final uid = client.auth.currentUser!.id;
        emit(UserLogicLoading());
        try {
          final result = await client.from("users").select().eq('id', uid);
          if (result.isNotEmpty) {
            print("User is Exist in Database");
            final encodedBody = jsonEncode(result.first);
            tempUser = UserEntity.fromJson(encodedBody);
            emit(
                UserLogicSuccess(userEntity: UserEntity.fromJson(encodedBody)));
          } else {
            final phone = client.auth.currentUser!.phone;
            final result = await client
                .from("users")
                .insert({
                  'name': "",
                  'email': "",
                  'phone': phone!.substring(phone.length - 10),
                  'city': "",
                })
                .select()
                .single();
            final encodedBody = jsonEncode(result);
            tempUser = UserEntity.fromJson(encodedBody);
            emit(
                UserLogicSuccess(userEntity: UserEntity.fromJson(encodedBody)));
          }
        } on PostgrestException catch (e) {
          emit(UserLogicError(err: e.message));
        }
      } else {
        print("User Available in Cache");
      }
    }
  }

  setUserNull() {
    tempUser = null;
  }
}
