part of 'fetch_favorite_pets_cubit.dart';

class FetchFavoritesPetsState {

  final List<PetEntity> petsList;
  final String err;
  final bool loading;

  const FetchFavoritesPetsState({
    required this.petsList,
    required this.err,
    required this.loading,
  });

  factory FetchFavoritesPetsState.initial() {
    return const FetchFavoritesPetsState(
      petsList: [],
      loading: true,
      err: "",
    );
  }

  FetchFavoritesPetsState copyWith({
    List<PetEntity>? petsList,
    String? err,
    bool? loading,
  }) {
    return FetchFavoritesPetsState(
      petsList: petsList ?? this.petsList,
      err: err ?? this.err,
      loading: loading ?? this.loading,
    );
  }
}
