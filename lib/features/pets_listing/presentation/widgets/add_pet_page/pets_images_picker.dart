import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';

class PetsImagesPicker extends StatelessWidget {
  const PetsImagesPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: const Color(0xFFE0E3E7),
            ),
          ),
          child: BlocBuilder<TempPetCubit, TempPetState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Pick Pets Images"),
                  ),
                  state.pics.isEmpty
                      ? IconButton(
                          icon: const Icon(Icons.add_a_photo, size: 50),
                          onPressed: () {
                            context.read<TempPetCubit>().selectingImages();
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 5,
                            children: state.pics
                                .map((e) => InkWell(
                                      onTap: () {
                                        context
                                            .read<TempPetCubit>()
                                            .removingImage(
                                                state.pics.indexOf(e));
                                      },
                                      child: Image.memory(e, height: 50),
                                    ))
                                .toList(),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
