import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';
import 'package:aladia_demo_app/auth/domain/usecase/auth_usecase.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_state.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_event.dart';


class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
    final VerifyUsecase verifyUsecase;
  

  VerifyBloc(this.verifyUsecase) : super(VerifyInitial()) {
    on<VerifiedEvent>((event, emit) async {
      emit(VerifyInitial());
      final res = await verifyUsecase(VerifyParams(event.email));

      res.fold(
        (l) {
          emit(VerifyError(message: l.message));
        },
        (r) {
          if (r == true) {
            emit(VerifySuccess(message: 'exist'));
          } else {
            emit(VerifyError(message: 'doesn\'t exist'));
          }
        },
      );
    });
  }
}
