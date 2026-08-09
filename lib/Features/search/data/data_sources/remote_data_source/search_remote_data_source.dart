import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchRemoteDataSource({required String bookName});
}
