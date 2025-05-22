part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordLoaded extends ForgotPasswordState {}

final class ForgotPasswordError extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordError({required this.errorMessage});
}
