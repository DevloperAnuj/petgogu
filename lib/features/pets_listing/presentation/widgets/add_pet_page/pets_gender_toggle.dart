import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';

class PetGenderToggle extends StatelessWidget {
  const PetGenderToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 20,
          children: [
            ChoiceChip(
              label: const Text("Male"),
              selected: context.watch<TempPetCubit>().state.gender,
              onSelected: (_) {
                context.read<TempPetCubit>().getGender(true);
              },
            ),
            ChoiceChip(
              label: const Text("Female"),
              selected: !context.watch<TempPetCubit>().state.gender,
              onSelected: (_) {
                context.read<TempPetCubit>().getGender(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
