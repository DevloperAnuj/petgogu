part of 'reg_logic_cubit.dart';

@immutable
sealed class RegLogicState {}

final class RegLogicInitial extends RegLogicState {}

final class RegLogicLoading extends RegLogicState {}

final class RegLogicSuccess extends RegLogicState {
  final String uid;

  RegLogicSuccess({
    required this.uid,
  });
}

final class RegLogicError extends RegLogicState {
  final String err;

  RegLogicError({
    required this.err,
  });
}
