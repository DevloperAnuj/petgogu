import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';
import 'package:petgogu/utils/my_alerts.dart';
import 'pet_list_card.dart';

class PetsListSection extends StatelessWidget {
  const PetsListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: BlocConsumer<FetchPetsCubit, FetchPetsState>(
        listener: (context, state) {
          if (state.err != "") {
            MyAlerts.showMySnackBar(
              context,
              content: state.err,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          if (state.loading) {
            return const LinearProgressIndicator();
          }
          if (state.err != "") {
            return const Center(child: Icon(Icons.error_rounded));
          }
          if (state.petsList.isNotEmpty) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 5, // spacing between rows
                crossAxisSpacing: 5, // spacing between columns
              ),
              itemCount: state.petsList.length,
              itemBuilder: (context, i) {
                final PetEntity pet = state.petsList[i];
                return PetListCard(
                  i: i,
                  petEntity: pet,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
