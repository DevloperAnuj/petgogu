import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/temp_pet/temp_pet_cubit.dart';

class PetWeightParameterToggle extends StatelessWidget {
  const PetWeightParameterToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Wrap(
          spacing: 5,
          children: [
            ChoiceChip(
              label: const Text("Gram"),
              selected: !context.watch<TempPetCubit>().state.inkg,
              onSelected: (_) {
                context.read<TempPetCubit>().getWeightParam(false);
              },
            ),
            ChoiceChip(
              label: const Text("KG"),
              selected: context.watch<TempPetCubit>().state.inkg,
              onSelected: (_) {
                context.read<TempPetCubit>().getWeightParam(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
