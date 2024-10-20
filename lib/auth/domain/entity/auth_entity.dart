import 'package:equatable/equatable.dart';

class LogInEntity extends Equatable {
  final String email;
  final String password;

  const LogInEntity({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class VerifyEmailEntity extends Equatable {
  final String email;

  const VerifyEmailEntity({required this.email});
  @override
  List<Object> get props => [email];
}
