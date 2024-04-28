import 'dart:convert';

class UserEntity {
  final String id;
  final DateTime createdAt;
  final String name;
  final String email;
  final String phone;
  final String city;

  UserEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
  });

  UserEntity copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
    String? email,
    String? phone,
    String? city,
  }) =>
      UserEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        city: city ?? this.city,
      );

  factory UserEntity.fromJson(String str) => UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "email": email,
    "phone": phone,
    "city": city,
  };

  Map<String, dynamic> toUpdateMap() => {
    "name": name,
    "phone": phone,
    "city": city,
  };

}
