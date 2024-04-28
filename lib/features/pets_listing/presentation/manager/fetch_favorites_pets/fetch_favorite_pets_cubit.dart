import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/service_config.dart';
import '../../../domain/entities/pet_entitiety.dart';

part 'fetch_favorite_pets_state.dart';

class FetchFavoritePetsCubit extends Cubit<FetchFavoritesPetsState> {
  FetchFavoritePetsCubit() : super(FetchFavoritesPetsState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PetEntity> favPetsList = [];

  void fetchFavPets() async {
    emit(state.copyWith(loading: true));
    try {
      final uid = client.auth.currentUser!.id;
      final response = await client
          .from('fav')
          .select('''*,pet:pets(*,owner(*))''').eq("by", uid);
      final encodedData = jsonEncode(response);
      Iterable decodedData = jsonDecode(encodedData);
      final fetchList = decodedData
          .map((pet) => PetEntity.fromMap(pet['pet']))
          .toList()
          .where((element) => element.status == 0)
          .toList();
      favPetsList = fetchList;
      emit(state.copyWith(petsList: fetchList, loading: false));
    } on PostgrestException catch (e) {
      print(e);
      emit(state.copyWith(
        petsList: [],
        err: e.message,
        loading: false,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(
        err: "Error while Fetching pets",
        loading: false,
        petsList: [],
      ));
    }
  }

  void addToFavoriteList(PetEntity petEntity) async {
    if (favPetsList.any((element) => element.id == petEntity.id)) {
      await client.from('fav').delete().eq('pet', petEntity.id);
      favPetsList.removeWhere((pet) => pet.id == petEntity.id);
    } else {
      await client.from('fav').insert({'pet': petEntity.id});
      favPetsList.add(petEntity);
    }
    emit(state.copyWith(petsList: favPetsList));
  }
}
