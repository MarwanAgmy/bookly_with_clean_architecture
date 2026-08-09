import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/domain/repo/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/no_param_use_case.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase extends UseCaseWithParam<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(String bookName) async {
    return await searchRepo.searchBooks(bookName: bookName);
  }
}
