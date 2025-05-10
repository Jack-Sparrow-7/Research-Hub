part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

final class LogoutRequested extends AuthEvent {}

final class UpdateProfile extends AuthEvent {
  final String displayName;
  final String imageUrl;

  UpdateProfile({required this.displayName, required this.imageUrl});
}
