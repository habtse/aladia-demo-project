import 'package:aladia_demo_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call( Params param);
}

class NoParams {
  NoParams();
}
