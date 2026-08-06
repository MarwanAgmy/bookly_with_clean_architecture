import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseWithParam<TypeOf, Param> {
  Future<Either<Failure, TypeOf>> call(Param param);
}
