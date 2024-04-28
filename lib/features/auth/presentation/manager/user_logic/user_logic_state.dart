part of 'user_logic_cubit.dart';

@immutable
sealed class UserLogicState {}

final class UserLogicInitial extends UserLogicState {}

final class UserLogicLoading extends UserLogicState {}

final class UserLogicSuccess extends UserLogicState {

  final UserEntity userEntity;

  UserLogicSuccess({
    required this.userEntity,
  });
}

final class UserLogicError extends UserLogicState {
  final String err;

  UserLogicError({
    required this.err,
  });
}
