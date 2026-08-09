import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> searchLocalDataSource({required String bookName});
}
