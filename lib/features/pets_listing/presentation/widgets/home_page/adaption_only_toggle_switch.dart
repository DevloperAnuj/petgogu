import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';

class AdaptionOnlyToggleSwitch extends StatefulWidget {
  const AdaptionOnlyToggleSwitch({
    super.key,
  });

  @override
  State<AdaptionOnlyToggleSwitch> createState() =>
      _AdaptionOnlyToggleSwitchState();
}

class _AdaptionOnlyToggleSwitchState extends State<AdaptionOnlyToggleSwitch> {
  bool showAdopt = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            const Text("Free Adoption Only"),
            const SizedBox(width: 10),
            Switch(
              value: showAdopt,
              onChanged: (value) {
                setState(() {
                  showAdopt = !showAdopt;
                });
                context.read<FetchPetsCubit>().showAdoptionOnly(showAdopt);
              },
            ),
          ],
        ),
      ),
    );
  }
}
