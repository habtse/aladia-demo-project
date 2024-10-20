import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';
import 'package:aladia_demo_app/auth/domain/repositoty/auth_repo.dart';
import 'package:aladia_demo_app/core/error/failure.dart';

import 'package:aladia_demo_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class LogInUseCase implements UseCase<String, LogInParams> {
  final AuthRepository authRepository;
  LogInUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(LogInParams params) async {
    return await authRepository.login(params.email, params.password);
  }
}

class LogInParams {
  final String email;
  final String password;
  LogInParams(this.password, this.email);
}

class VerifyUsecase implements UseCase<bool, VerifyParams> {
  final AuthRepository authRepository;
  VerifyUsecase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(VerifyParams params) async {
    return await authRepository.verifyEmail(params.email);
  }
}

class VerifyParams {
  final String email;
  VerifyParams(this.email);
}
