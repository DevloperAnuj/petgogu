part of 'fetch_admin_pets_cubit.dart';

class FetchAdminPetsState {

  final List<PetEntity> allPets ;
  final List<PetEntity> pendingPets ;
  final List<PetEntity> approvedPets ;
  final List<PetEntity> delistPets;
  final List<PetEntity> withheldPets;


  factory FetchAdminPetsState.initial() {
    return const FetchAdminPetsState(
      allPets: <PetEntity>[],
      pendingPets: <PetEntity>[],
      approvedPets: <PetEntity>[],
      delistPets: <PetEntity>[],
      withheldPets: <PetEntity>[],
    );
  }

  const FetchAdminPetsState({
    required this.allPets,
    required this.pendingPets,
    required this.approvedPets,
    required this.delistPets,
    required this.withheldPets,
  });

  FetchAdminPetsState copyWith({
    List<PetEntity>? allProperties,
    List<PetEntity>? pendingProperties,
    List<PetEntity>? approvedProperties,
    List<PetEntity>? delistProperties,
    List<PetEntity>? withheldProperties,
  }) {
    return FetchAdminPetsState(
      allPets: allProperties ?? this.allPets,
      pendingPets: pendingProperties ?? this.pendingPets,
      approvedPets: approvedProperties ?? this.approvedPets,
      delistPets: delistProperties ?? this.delistPets,
      withheldPets: withheldProperties ?? this.withheldPets,
    );
  }
}

