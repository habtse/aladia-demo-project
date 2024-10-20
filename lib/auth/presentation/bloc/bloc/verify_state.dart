import 'package:flutter/foundation.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}

final class VerifyLoadingState extends VerifyState {}

final class VerifyLoaded extends VerifyState {
  final String message;
  VerifyLoaded({required this.message});
}

final class VerifySuccess extends VerifyState {
  final String message;
  VerifySuccess({required this.message});
}

final class VerifyError extends VerifyState {
  final String message;
  VerifyError({required this.message});
}
