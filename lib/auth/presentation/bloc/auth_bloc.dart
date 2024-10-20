import 'package:aladia_demo_app/auth/domain/usecase/auth_usecase.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInUseCase logInUseCase;

  AuthBloc(this.logInUseCase) : super(AuthInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final res = await logInUseCase(LogInParams(event.email, event.password));

      res.fold(
        (l) {
          emit(AuthErrorState(message: l.message));
        },
        (r) {
          emit(AuthSuccessState(message: r));
        },
      );
    });
  }
}
