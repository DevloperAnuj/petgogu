import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../utils/service_config.dart';

part 'fetch_admin_pets_state.dart';

class FetchAdminPetsCubit extends Cubit<FetchAdminPetsState> {
  FetchAdminPetsCubit() : super(FetchAdminPetsState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PetEntity> allPets = [];

  // List<PropertyEntity> pendingProperties = [];
  // List<PropertyEntity> approvedProperties = [];
  // List<PropertyEntity> delistProperties = [];
  // List<PropertyEntity> withheldProperties = [];

  void fetchProperties() async {
    try {
      final result =
          await client.from("pets").select('''*,owner(*)''').order('created_at',ascending: false);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      allPets = decodedBody
          .map((property) => PetEntity.fromMap(property))
          .toList();
      emit(
        state.copyWith(
          allProperties: decodedBody
              .map((property) => PetEntity.fromMap(property))
              .toList(),
          pendingProperties: allPets.where((p) => p.status == 3).toList(),
          approvedProperties:
              allPets.where((p) => p.status == 0).toList(),
          delistProperties: allPets.where((p) => p.status == 1).toList(),
          withheldProperties:
              allPets.where((p) => p.status == 2).toList(),
        ),
      );
    } on PostgrestException catch (e) {
      emit(FetchAdminPetsState.initial());
      throw e.message;
    }
  }

  void takingActionOnProperty(PetEntity property, int status) async {
    try {
      await client
          .from("pets")
          .update({'status': status}).eq('id', property.id);
      allPets.removeWhere((element) => element.id == property.id);
      allPets.add(property.copyWith(status: status));
      emit(
        state.copyWith(
          allProperties: allPets,
          pendingProperties: allPets.where((p) => p.status == 3).toList(),
          approvedProperties:
              allPets.where((p) => p.status == 0).toList(),
          delistProperties: allPets.where((p) => p.status == 1).toList(),
          withheldProperties:
              allPets.where((p) => p.status == 2).toList(),
        ),
      );
    } on PostgrestException catch (e) {
      throw e.message;
    }
  }
}
