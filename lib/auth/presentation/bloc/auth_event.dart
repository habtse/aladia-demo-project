part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class LogInEvent extends AuthEvent {
  final String email;
  final String password;
  const LogInEvent({required this.email,required this.password});
}
