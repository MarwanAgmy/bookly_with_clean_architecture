import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/no_param_use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCaseWithParam<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(int pageNumber) async {
    return await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }
}
