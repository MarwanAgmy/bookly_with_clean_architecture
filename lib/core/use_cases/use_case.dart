import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<TypeOf, Param> {
  Future<Either<Failure, TypeOf>> call(Param param);
}
