enum AuthStatus { initial, loading, success, error, passwordVisible, passwordHidden, emailVerified }
sealed class AuthState {
  final AuthStatus status;
  const AuthState(this.status);
}

final class AuthInitial extends AuthState {
  const AuthInitial() : super(AuthStatus.initial);
}

final class AuthLoadingState extends AuthState {
  const AuthLoadingState() : super(AuthStatus.loading);
}

final class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message}) : super(AuthStatus.error);
}

final class AuthSuccessState extends AuthState {
  final String message;
  const AuthSuccessState({required this.message}) : super(AuthStatus.success);
}
final class AuthUpdateState extends AuthState {
  final String message;
  const AuthUpdateState({required this.message}) : super(AuthStatus.success);
}





