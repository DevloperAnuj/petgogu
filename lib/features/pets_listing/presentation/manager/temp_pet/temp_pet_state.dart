part of 'temp_pet_cubit.dart';

class TempPetState {
  final String category;
  final String name;
  final String breed;
  final double age;
  final double weight;
  final bool gender;
  final bool forAdaption;
  final String description;
  final List<Uint8List> pics;
  final List<String> picsUrl;

  const TempPetState({
    required this.category,
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.gender,
    required this.forAdaption,
    required this.description,
    required this.pics,
    required this.picsUrl,
  });

  factory TempPetState.initial() {
    return const TempPetState(
      category: "Select Pet Category",
      name: "",
      breed: "Select Pet Breed",
      age: 0,
      weight: 0,
      gender: true,
      forAdaption: false,
      description: "",
      pics: [],
      picsUrl: [],
    );
  }

  TempPetState copyWith({
    String? category,
    String? name,
    String? breed,
    double? age,
    double? weight,
    bool? gender,
    bool? forAdaption,
    String? description,
    List<Uint8List>? pics,
    List<String>? picsUrl,
  }) {
    return TempPetState(
      category: category ?? this.category,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      forAdaption: forAdaption ?? this.forAdaption,
      description: description ?? this.description,
      pics: pics ?? this.pics,
      picsUrl: picsUrl ?? this.picsUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'name': name,
      'breed': breed,
      'age': age,
      'weight': weight,
      'gender': gender,
      'forAdaption': forAdaption,
      'description': description,
      'pics': pics,
      'picsUrl': picsUrl,
    };
  }
}
