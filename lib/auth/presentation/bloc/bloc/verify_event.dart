part of 'verify_bloc.dart';

@immutable
sealed class VerifyEvent {
  const VerifyEvent();
}


final class VerifiedEvent extends VerifyEvent {
  final String email;
  const VerifiedEvent({required this.email});
}