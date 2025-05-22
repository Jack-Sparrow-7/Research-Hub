part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ResetPasswordEvent extends ForgotPasswordEvent {
  final String email;

  ResetPasswordEvent({required this.email});
}
