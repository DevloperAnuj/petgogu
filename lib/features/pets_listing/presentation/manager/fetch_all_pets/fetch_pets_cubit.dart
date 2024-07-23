import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/entities/pet_entitiety.dart';

part 'fetch_pets_state.dart';

class FetchPetsCubit extends Cubit<FetchPetsState> {
  FetchPetsCubit() : super(FetchPetsState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PetEntity> allPets = [];
  List<PetEntity> allAdaptOnly = [];

  void fetchInitialPets() async {
    emit(state.copyWith(loading: true));
    try {
      final response = await client
          .from('pets')
          .select('''*,owner(*)''')
          .eq("status", 0)
          .order('created_at');
      final encodedData = jsonEncode(response);
      Iterable decodedData = jsonDecode(encodedData);
      final fetchList =
          decodedData.map((pet) => PetEntity.fromMap(pet)).toList();
      allPets = fetchList;
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

  void showAdoptionOnly(bool isAdopt) {
    if (isAdopt) {
      final adaptOnlyPets =
          allPets.where((element) => element.isadapt).toList();
      emit(state.copyWith(petsList: adaptOnlyPets, loading: false, err: ""));
    } else {
      emit(state.copyWith(petsList: allPets, loading: false, err: ""));
    }
  }

  void showPetsByCategory(String category) async {
    if (category == 'Others') {
      final petsByOthers = allPets
          .where((element) =>
              element.category != 'Dogs' &&
              element.category != 'Cats' &&
              element.category != 'Birds' &&
              element.category != 'Fishes')
          .toList();
      emit(state.copyWith(petsList: petsByOthers, loading: false, err: ""));
    } else if (category != "All") {
      final petsByCategory =
          allPets.where((element) => element.category == category).toList();
      emit(state.copyWith(petsList: petsByCategory, loading: false, err: ""));
    } else {
      emit(state.copyWith(petsList: allPets, loading: false, err: ""));
    }
  }

  void showPetsBySearch(String searchText) {
    if (searchText.trim().isNotEmpty) {
      final petsBySearch = allPets
          .where((element) =>
              element.breed.toLowerCase().contains(searchText.toLowerCase()) ||
              element.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      emit(state.copyWith(petsList: petsBySearch, loading: false, err: ""));
    } else {
      emit(state.copyWith(petsList: allPets, loading: false, err: ""));
    }
  }
  
  void loadMorePets(){
    
  }

}
