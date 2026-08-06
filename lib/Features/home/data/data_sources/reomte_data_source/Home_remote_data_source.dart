import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumbers = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}
