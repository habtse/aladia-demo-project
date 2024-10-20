import 'package:aladia_demo_app/auth/data/datasource/auth_datasource.dart';
import 'package:aladia_demo_app/auth/data/model/auth_model.dart';
import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';
import 'package:aladia_demo_app/auth/domain/repositoty/auth_repo.dart';
import 'package:aladia_demo_app/core/error/exception.dart';
import 'package:aladia_demo_app/core/error/failure.dart';
import 'package:aladia_demo_app/core/network/network.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepoImpl(this.authRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, String>> login(email, password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = LogInModel(email:email, password: password);
        final token = await authRemoteDataSource.logIn(user);
        print(token);
        return Right(token);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(
          NetworkFailure(message: 'You are not connected to the internet'));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail(email) async {
    if (await networkInfo.isConnected) {
      try {
        final user = VerifyEmailModel(email: email);
        final exist = await authRemoteDataSource.verifyEmail(user);
        print(exist);

        return Right(exist);
      } on ServerException {
        return Left(ServerFailure(message: 'Server Failure'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'You are not connected to the internet'));
    }
  }
}
