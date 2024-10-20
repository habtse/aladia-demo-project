
import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';
import 'package:aladia_demo_app/core/error/failure.dart';


import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login(email,password);
  Future<Either<Failure, bool>> verifyEmail( email);
}
