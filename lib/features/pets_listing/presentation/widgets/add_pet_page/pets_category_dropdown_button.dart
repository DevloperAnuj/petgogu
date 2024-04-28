import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';

class PetsCategoryDropdownButton extends StatelessWidget {
  const PetsCategoryDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: const Color(0xFFE0E3E7),
          ),
        ),
        child: DropdownButton<String>(
          value: context.watch<TempPetCubit>().state.category,
          items: <String>[
            'Select Pet Category',
            'Dogs',
            'Cats',
            'Birds',
            'Fishes'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (selected) {
            if (selected != null) {
              context.read<TempPetCubit>().getCategory(selected);
            }
            context.read<TempPetCubit>().getBreed("Select Pet Breed");
          },
          icon: const Icon(null),
          alignment: Alignment.center,
          underline: const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class PetsBreedDropdownButton extends StatefulWidget {
  const PetsBreedDropdownButton({
    super.key,
  });

  @override
  State<PetsBreedDropdownButton> createState() =>
      _PetsBreedDropdownButtonState();
}

class _PetsBreedDropdownButtonState extends State<PetsBreedDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: const Color(0xFFE0E3E7),
          ),
        ),
        child: DropdownButton<String>(
          value: context.watch<TempPetCubit>().state.breed,
          items: petsBreedList().map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (selected) {
            if (selected != null) {
              context.read<TempPetCubit>().getBreed(selected);
            }
          },
          icon: const Icon(null),
          alignment: Alignment.center,
          underline: const SizedBox.shrink(),
        ),
      ),
    );
  }

  List<String> petsBreedList() {
    if (context.watch<TempPetCubit>().state.category == "Dogs") {
      return [
        "Select Pet Breed",
        "Indian stay Dogs",
        "Labrador dog",
        "Golden Retriever",
        "Doberman",
        "German Shepherd",
        "Pomeranian dog",
        "Indian spitz dog",
        "Lhasa Apso",
        "Shih tzu",
        "Siberian Husky",
        "Beagle",
        "Best hound",
        "Caravan hound",
        "Pashmi hound",
        "Greyhound",
        "Mudhol hound",
        "Great Dane",
        "Belgian Malinos",
        "Dalmatian dog",
        "Chihuahua",
        "Chaw Chaw",
        "Pug",
        "Boxer",
        "Poodle",
        "Raja palayam",
        "Cocker Spaniel"
      ];
    }
    if (context.watch<TempPetCubit>().state.category == "Cats") {
      return [
        "Select Pet Breed",
        "Indian street cat",
        "Persian",
        "Maine coon",
        "Bengal",
        "British short hair",
        "American short hair",
        "Ragdoll",
        "Siamese",
        "Exotic short hair",
        "Abyssinian",
        "Devon rex",
        "Somali",
        "Scotish fold",
        "Birman",
        "Siberian cat",
        "Russian blue",
        "Norwegian forest cat",
        "Cornish rex",
        "American bobtail",
        "Turkish angora",
        "Savannah cat",
        "Ocicat",
        "Munchkin cat",
        "Snoshoe cat",
        "Japnise bobtail",
      ];
    }
    if (context.watch<TempPetCubit>().state.category == "Birds") {
      return [
        "Select Pet Breed",
        "Love birds",
        "Budgerigar",
        "Cockatil",
        "Sun Conure",
        "Grey parrot",
        "Conure",
        "Cockatoos",
        "Macaw",
        "Amazon parrot",
        "Monk prakeet",
        "Lorikeet parrot",
        "Eclectus parrot",
        "Hawk Headed parrot",
        "Senegal parrot",
        "Zebra Finch",
        "Java Finch",
        "Golden Finch",
        "Pigeon",
        "Duck",
        "Turkey Bird",
        "Guineafowls",
        "Asil Hen",
        "Silk Hen",
      ];
    }
    if (context.watch<TempPetCubit>().state.category == "Fishes") {
      return [
        "Select Pet Breed",
        "Discus",
        "Arowana",
        "Flowerhorn",
        "Peacock bass",
        "Oscur",
        "Parrot fish",
        "Cichlids",
        "Stingrays",
        "Eligator gar",
        "Gurami",
        "Red tail catfish",
        "Severum",
        "Betta fish",
        "Senegal",
        "Gold fish",
        "Koi fish",
        "Gappi",
        "Moli",
        "Red cap",
        "Silver shark",
        "Black more",
        "Angle",
        "Widow",
        "Tetra fish",
        "Doller",
        "Redtail catfish",
        "Geo fegous",
      ];
    }
    return ["Select Pet Breed"];
  }
}
