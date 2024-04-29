import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'temp_pet_state.dart';

class TempPetCubit extends Cubit<TempPetState> {
  TempPetCubit() : super(TempPetState.initial());

  List<Uint8List> tempImages = [];

  void getName(String name) {
    emit(state.copyWith(name: name));
  }

  void getDesc(String desc) {
    emit(state.copyWith(description: desc));
  }

  void getCategory(String category) {
    emit(state.copyWith(category: category));
  }

  void getBreed(String breed) {
    emit(state.copyWith(breed: breed));
  }

  void getAge(String age) {
    if (age.isNotEmpty) {
      emit(state.copyWith(age: double.parse(age)));
    }
  }

  void getWeight(String weight) {
    if (weight.isNotEmpty) {
      emit(state.copyWith(weight: double.parse(weight)));
    }
  }

  void getGender(bool gender) {
    emit(state.copyWith(gender: gender));
  }

  void getAdaption(bool adapt) {
    emit(state.copyWith(forAdaption: adapt));
  }

  void selectingImages() async {
    final List<XFile> result =
        await ImagePicker().pickMultiImage(imageQuality: 75);
    if (result.isNotEmpty) {
      for (XFile file in result) {
        tempImages.add(await file.readAsBytes());
      }
    }
    emit(state.copyWith(pics: tempImages));
  }

  void removingImage(int i) {
    if (tempImages.isNotEmpty) {
      tempImages.removeAt(i);
      emit(state.copyWith(pics: tempImages));
    }
  }

  void setToInit() {
    tempImages.clear();
    emit(TempPetState.initial());
  }
}
