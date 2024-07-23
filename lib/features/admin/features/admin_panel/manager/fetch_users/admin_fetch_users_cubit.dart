import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:petgogu/features/users/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../utils/service_config.dart';


part 'admin_fetch_users_state.dart';

class AdminFetchUsersCubit extends Cubit<AdminFetchUsersState> {
  AdminFetchUsersCubit() : super(AdminFetchUsersState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  void fetchAllUsers() async {
    try {
      final result = await client.from("users").select().order('created_at',ascending: false);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      emit(state.copyWith(
          allUsers: decodedBody
              .map((user) => UserEntity.fromMap(user))
              .toList()));
    } on PostgrestException catch (e) {
      emit(state.copyWith(allUsers: []));
      throw e.message;
    }
  }
}
