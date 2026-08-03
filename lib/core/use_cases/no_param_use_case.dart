import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<TypeOf> {
  Future<Either<Failure, TypeOf>> call();
}
