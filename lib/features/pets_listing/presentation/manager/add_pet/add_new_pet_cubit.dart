import 'dart:math';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';
import 'package:petgogu/utils/service_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_new_pet_state.dart';

class AddNewPetCubit extends Cubit<AddNewPetState> {
  AddNewPetCubit() : super(AddNewPetInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();
  final tempPetCubit = serviceConfig.get<TempPetCubit>();
  List<String> picsList = [];

  Future<List<String>> uploadImagesGetUrls() async {
    try {
      final String uniqueFolder =
          DateTime.now().microsecondsSinceEpoch.toString();
      for (Uint8List img in tempPetCubit.state.pics) {
        final imgName =
            "image-${Random().nextInt(10)}${Random().nextInt(10)}.jpeg";
        await client.storage.from("pets").uploadBinary(
              "$uniqueFolder/$imgName",
              img,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );
        final imgUrl =
            client.storage.from("pets").getPublicUrl("$uniqueFolder/$imgName");
        picsList.add(imgUrl);
      }
      return picsList;
    } on StorageException catch (e) {
      print("======== Storage Exception ========= $e");
      throw e.message;
    }
  }

  void addDataToDatabase() async {
    try {
      await client.from("pets").insert({
        "name": tempPetCubit.state.name,
        "category": tempPetCubit.state.category,
        "breed": tempPetCubit.state.breed,
        "age": tempPetCubit.state.age,
        "weight": tempPetCubit.state.weight,
        "gender": tempPetCubit.state.gender,
        "desc": tempPetCubit.state.description,
        "isadapt": tempPetCubit.state.forAdaption,
        "pics": picsList,
      });
    } on PostgrestException catch (e) {
      print("${e.message}======= addDataToDatabase =========");
      rethrow;
    } finally {
      picsList.clear();
    }
  }

  void insertPet() async {
    try {
      emit(AddNewPetLoading());
      await uploadImagesGetUrls();
      addDataToDatabase();
      emit(AddNewPetSuccess());
    } on StorageException catch (e) {
      print(e.message);
      emit(AddNewPetError(err: e.message));
    } on PostgrestException catch (e) {
      print(e.message);
      emit(AddNewPetError(err: e.message));
    }
  }
}
