import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/data_sources/local_data_source/search_local_data_source.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> searchLocalDataSource({required String bookName}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.where((book) {
      return book.title.toLowerCase().contains(bookName.toLowerCase());
    }).toList();
  }
}
