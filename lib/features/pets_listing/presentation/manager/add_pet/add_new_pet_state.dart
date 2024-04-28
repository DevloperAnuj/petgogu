part of 'add_new_pet_cubit.dart';

@immutable
sealed class AddNewPetState {}

final class AddNewPetInitial extends AddNewPetState {}

final class AddNewPetLoading extends AddNewPetState {}

final class AddNewPetSuccess extends AddNewPetState {}

final class AddNewPetError extends AddNewPetState {
  final String err;

  AddNewPetError({
    required this.err,
  });
}
