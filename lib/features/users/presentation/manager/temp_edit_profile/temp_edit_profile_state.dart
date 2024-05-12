part of 'temp_edit_profile_cubit.dart';

class TempEditProfileState {
  final String email;
  final String name;
  final String city;

  const TempEditProfileState({
    required this.email,
    required this.name,
    required this.city,
  });

  factory TempEditProfileState.initial() {
    return TempEditProfileState(email: '', name: '', city: '');
  }

  TempEditProfileState copyWith({
    String? email,
    String? name,
    String? city,
  }) {
    return TempEditProfileState(
      email: email ?? this.email,
      name: name ?? this.name,
      city: city ?? this.city,
    );
  }
}
