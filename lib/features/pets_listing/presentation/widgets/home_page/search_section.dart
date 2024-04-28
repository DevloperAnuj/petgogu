import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: TextFormField(
        onChanged: (searchText) {
          context.read<FetchPetsCubit>().showPetsBySearch(searchText);
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            prefixIcon: const Icon(Icons.search_rounded),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            hintText: "Search Your Favorite Pet Here..."),
      ),
    );
  }
}
