part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final UserEnitity user;

  Authenticated({required this.user});
}

final class AutheError extends AuthState {
  final String erroMessage;

  AutheError({required this.erroMessage});
}
