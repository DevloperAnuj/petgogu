part of 'temp_pet_cubit.dart';

class TempPetState {
  final String category;
  final String othCategory;
  final String name;
  final String breed;
  final String othBreed;
  final double age;
  final double weight;
  final bool gender;
  final bool inkg;
  final bool forAdaption;
  final String description;
  final List<Uint8List> pics;
  final List<String> picsUrl;

  const TempPetState({
    required this.category,
    required this.othCategory,
    required this.name,
    required this.breed,
    required this.othBreed,
    required this.age,
    required this.weight,
    required this.gender,
    required this.forAdaption,
    required this.description,
    required this.pics,
    required this.picsUrl,
    required this.inkg,
  });

  factory TempPetState.initial() {
    return const TempPetState(
      category: "Select Pet Category",
      othCategory: "",
      name: "",
      breed: "Select Pet Breed",
      othBreed: "",
      age: 0,
      weight: 0,
      inkg: true,
      gender: true,
      forAdaption: false,
      description: "",
      pics: [],
      picsUrl: [],
    );
  }

  TempPetState copyWith({
    String? category,
    String? othCategory,
    String? name,
    String? breed,
    String? othBreed,
    double? age,
    double? weight,
    bool? inkg,
    bool? gender,
    bool? forAdaption,
    String? description,
    List<Uint8List>? pics,
    List<String>? picsUrl,
  }) {
    return TempPetState(
      category: category ?? this.category,
      othCategory: othCategory ?? this.othCategory,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      othBreed: othBreed ?? this.othBreed,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      inkg: inkg ?? this.inkg,
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
      'inkg': inkg,
    };
  }
}
