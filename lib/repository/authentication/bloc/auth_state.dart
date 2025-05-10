part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final User user;
  final String? displayName;
  final String? imageUrl;

  Authenticated({this.displayName, this.imageUrl, required this.user});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
