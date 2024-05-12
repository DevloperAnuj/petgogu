part of 'login_logic_cubit.dart';

@immutable
sealed class LoginLogicState {}

final class LoginLogicInitial extends LoginLogicState {}

final class LoginLogicLoading extends LoginLogicState {}

final class LoginLogicOtpSend extends LoginLogicState {
}

final class LoginLogicSuccess extends LoginLogicState {}

final class LoginLogicError extends LoginLogicState {
  final String err;

  LoginLogicError({
    required this.err,
  });
}
