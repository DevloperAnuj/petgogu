part of 'fetch_pets_cubit.dart';

class FetchPetsState {

  final List<PetEntity> petsList;
  final String err;
  final bool loading;

  const FetchPetsState({
    required this.petsList,
    required this.err,
    required this.loading,
  });

  factory FetchPetsState.initial() {
    return const FetchPetsState(
      petsList: [],
      loading: true,
      err: "",
    );
  }

  FetchPetsState copyWith({
    List<PetEntity>? petsList,
    String? err,
    bool? loading,
  }) {
    return FetchPetsState(
      petsList: petsList ?? this.petsList,
      err: err ?? this.err,
      loading: loading ?? this.loading,
    );
  }
}
