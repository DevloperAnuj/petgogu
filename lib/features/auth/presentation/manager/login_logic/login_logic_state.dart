part of 'login_logic_cubit.dart';

@immutable
sealed class LoginLogicState {}

final class LoginLogicInitial extends LoginLogicState {}

final class LoginLogicLoading extends LoginLogicState {}

final class LoginLogicSuccess extends LoginLogicState {
  final String uid;

  LoginLogicSuccess({
    required this.uid,
  });
}

final class LoginLogicError extends LoginLogicState {
  final String err;

  LoginLogicError({
    required this.err,
  });
}
