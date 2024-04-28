
import 'package:meta/meta.dart';
import 'dart:convert';

class PetEntity {
  final String id;
  final DateTime createdAt;
  final String name;
  final String category;
  final String breed;
  final bool gender;
  final double age;
  final bool isadapt;
  final int status;
  final String desc;
  final List<String> pics;
  final Owner owner;
  final double weight;

  PetEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.category,
    required this.breed,
    required this.gender,
    required this.age,
    required this.isadapt,
    required this.status,
    required this.desc,
    required this.pics,
    required this.owner,
    required this.weight,
  });

  PetEntity copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
    String? category,
    String? breed,
    bool? gender,
    double? age,
    bool? isadapt,
    int? status,
    String? desc,
    List<String>? pics,
    Owner? owner,
    double? weight,
  }) =>
      PetEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        category: category ?? this.category,
        breed: breed ?? this.breed,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        isadapt: isadapt ?? this.isadapt,
        status: status ?? this.status,
        desc: desc ?? this.desc,
        pics: pics ?? this.pics,
        owner: owner ?? this.owner,
        weight: weight ?? this.weight,
      );

  factory PetEntity.fromJson(String str) => PetEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetEntity.fromMap(Map<String, dynamic> json) => PetEntity(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    category: json["category"],
    breed: json["breed"],
    gender: json["gender"],
    age: json["age"]?.toDouble(),
    isadapt: json["isadapt"],
    status: json["status"],
    desc: json["desc"],
    pics: List<String>.from(json["pics"].map((x) => x)),
    owner: Owner.fromMap(json["owner"]),
    weight: json["weight"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "category": category,
    "breed": breed,
    "gender": gender,
    "age": age,
    "isadapt": isadapt,
    "status": status,
    "desc": desc,
    "pics": List<dynamic>.from(pics.map((x) => x)),
    "owner": owner.toMap(),
    "weight": weight,
  };
}

class Owner {
  final String id;
  final String city;
  final String name;
  final String email;
  final String phone;
  final DateTime createdAt;

  Owner({
    required this.id,
    required this.city,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  Owner copyWith({
    String? id,
    String? city,
    String? name,
    String? email,
    String? phone,
    DateTime? createdAt,
  }) =>
      Owner(
        id: id ?? this.id,
        city: city ?? this.city,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Owner.fromJson(String str) => Owner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
    id: json["id"],
    city: json["city"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "city": city,
    "name": name,
    "email": email,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
  };
}


final List<PetEntity> demoPetsList = [

];
