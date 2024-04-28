part of 'fetch_my_pets_cubit.dart';

class FetchMyPetsState {
  final List<PetEntity> petsList;
  final String err;
  final bool loading;

  const FetchMyPetsState({
    required this.petsList,
    required this.err,
    required this.loading,
  });

  factory FetchMyPetsState.initial() {
    return const FetchMyPetsState(
      petsList: [],
      loading: true,
      err: "",
    );
  }

  FetchMyPetsState copyWith({
    List<PetEntity>? petsList,
    String? err,
    bool? loading,
  }) {
    return FetchMyPetsState(
      petsList: petsList ?? this.petsList,
      err: err ?? this.err,
      loading: loading ?? this.loading,
    );
  }
}


