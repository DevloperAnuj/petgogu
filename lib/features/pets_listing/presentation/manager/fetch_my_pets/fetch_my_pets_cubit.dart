import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/service_config.dart';
import '../../../domain/entities/pet_entitiety.dart';

part 'fetch_my_pets_state.dart';

class FetchMyPetsCubit extends Cubit<FetchMyPetsState> {
  FetchMyPetsCubit() : super(FetchMyPetsState.initial());

  final client = serviceConfig.get<SupabaseClient>();
  List<PetEntity> myPetsList = [];

  void fetchMyPets() async {
    emit(state.copyWith(loading: true));
    try {
      final uid = client.auth.currentUser!.id;
      final response = await client
          .from('pets')
          .select('''*,owner(*)''')
          .eq("owner", uid)
          .eq('status', 0);
      final encodedData = jsonEncode(response);
      Iterable decodedData = jsonDecode(encodedData);
      final fetchList =
          decodedData.map((pet) => PetEntity.fromMap(pet)).toList();
      myPetsList = fetchList;
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

  void deListMyPet(PetEntity pet) async {
    if (myPetsList.any((element) => element.id == pet.id)) {
      await client.from('pets').update({'status': 1}).eq('id', pet.id);
      myPetsList.removeWhere((myPet) => myPet.id == pet.id);
    }
    emit(state.copyWith(petsList: myPetsList));
  }

}
