import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/data_sources/local_data_source/search_local_data_source.dart';
import 'package:bookly_app/Features/search/data/data_sources/remote_data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl({
    required this.searchRemoteDataSource,
    required this.searchLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String bookName,
  }) async {
    if (bookName.trim().isEmpty) {
      return right([]);
    }
    try {
      List<BookEntity> books = await searchRemoteDataSource
          .searchRemoteDataSource(bookName: bookName);
      return Right(books);
    } catch (e) {
      print("❌ Search API Error: $e");
      List<BookEntity> localBooks = searchLocalDataSource.searchLocalDataSource(
        bookName: bookName,
      );
      if (localBooks.isNotEmpty) {
        return Right(localBooks);
      }

      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
