import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/add_pet/add_new_pet_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/widgets/add_pet_page/add_pet_textfield.dart';
import 'package:petgogu/utils/service_config.dart';

import '../widgets/add_pet_page/add_pet_button.dart';
import '../widgets/add_pet_page/pets_category_dropdown_button.dart';
import '../widgets/add_pet_page/pets_gender_toggle.dart';
import '../widgets/add_pet_page/pets_images_picker.dart';

class AddPetsPage extends StatelessWidget {
  const AddPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<TempPetCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<AddNewPetCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text("Add Pet"),
                  ),
                  const PetsCategoryDropdownButton(),
                  const PetsBreedDropdownButton(),
                  AddPetTextField(
                    initVal: "",
                    labelText: "Pet Name",
                    onChange: (text) {
                      context.read<TempPetCubit>().getName(text);
                    },
                  ),
                  AddPetTextField(
                    initVal: "",
                    labelText: "Pets Age in Years",
                    inputType: TextInputType.number,
                    onChange: (text) {
                      context.read<TempPetCubit>().getAge(text);
                    },
                  ),
                  AddPetTextField(
                    initVal: "",
                    labelText: "Pets Weight in KG",
                    inputType: TextInputType.number,
                    onChange: (text) {
                      context.read<TempPetCubit>().getWeight(text);
                    },
                  ),
                  const PetGenderToggle(),
                  AddPetTextField(
                    initVal: "",
                    labelText: "Pets Description",
                    minLines: 5,
                    onChange: (text) {
                      context.read<TempPetCubit>().getDesc(text);
                    },
                  ),
                  const PetsImagesPicker(),
                  CheckboxListTile(
                    title: const Text("Enlist For Adoption"),
                    value: context.watch<TempPetCubit>().state.forAdaption,
                    onChanged: (val) {
                      context.read<TempPetCubit>().getAdaption(val!);
                    },
                  ),
                  const AddPetButton(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
